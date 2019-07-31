require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'anemone'
require 'kconv'
require 'csv'

time = Time.now.strftime('%Y%m%d-%H%M%S')
header = %w[name url drinks]
url = 'https://www.hotpepper.jp/yoyaku/SA11/Y050/'
# BEERS = /アサヒ|
#         キリン|
#         サッポロ|
#         ヱビスビール|
#         ザ・モルツ|
#         ザ・プレミアム・モルツ|
#         ビール/

CSV.open("./lib/result_ikebukuro_#{time}.csv", 'a') do |csv|
  csv << header

  Anemone.crawl(url, skip_quary_strings: true, delay: 10, user_agent: 'Mac Safari 4') do |anemone|
    page_nm = 1
    anemone.focus_crawl do |page|
      page.links.keep_if do |link|
        link.to_s.match('https://www.hotpepper.jp/yoyaku/SA11/Y050/bgn')
      end
    end

    # あるエリアのページを巡回
    anemone.on_every_page do |page|
      puts "〜〜〜〜〜〜〜〜〜〜〜〜〜#{page_nm}目〜〜〜〜〜〜〜〜〜〜〜〜"
      puts page.url

      page_nm += 1
       begin
        html = URI(page.url).read

        # 各ページのHTML解析
        doc = Nokogiri::HTML(html.toutf8, nil, 'utf-8')

        # 店舗記載のブロックを取得
        stores = doc.xpath(
          "//div[@class='shopDetailText']"
        )

        stores.each do |store|
          store_array = []
          # 店舗名取得
          store_name = store.xpath(
            ".//a[@class='fs18 bold lh22 marB1']"
          ).text

          # 店舗id取得
          store_id = store.xpath(
            ".//a[@class='fs18 bold lh22 marB1']"
          ).attribute('href').text

          # drink_url = "https://www.hotpepper.jp#{store_id}drink/"
          drink_url = "https://www.hotpepper.jp#{store_id}drink/"
          drink_num = 1
          drink_array = []
          # draft_beers = []
          # low_malt_beers
          sleep(5)

          begin
              doc_drink = Nokogiri::HTML(URI(drink_url).read, nil, 'utf-8')

              # drinkメニューHTML取得
              drinks =  doc_drink.xpath(
                "//div[@class='shopInner']/h3"
              )

              drinks.each do |drink|
                # drink名取得
                drink_name = p drink.text.gsub("\"", "")
                # xpath(
                #   "//h3[(contains(text(), 'ビール')) or (contains(text(), 'アサヒ')) or (contains(text(), 'キリン')) or (contains(text(), 'サッポロ')) or (contains(text(), 'ヱビスビール')) or (contains(text(), 'モルツ'))]"
                # )


                # drink値段取得
                drink_price = p doc_drink.xpath(
                  "//dl[@class='price' and position()=#{drink_num}]/dd"
                ).text.gsub("\"", "")

                regex = /(\d{1,4})/
                drink_price =~ regex
                price_only_num = p $1.to_i

                if (/ビール|アサヒ|キリン|サッポロ|ヱビスビール|エビス|モルツ/ =~ drink_name) &&
                  (/ノンアルコール|ベース|ゼロ|フリー|零|甘太郎|クリア|ホップ|シャンディ|トマト|レッド|カシス|オレンジ|カンパリ/ !~ drink_name) &&
                  (drink_name.length <= 25) &&
                  (price_only_num != 0) &&
                  (price_only_num <= 1000) then
                    drink_array.push(drink_name, [drink_price])
                end
                drink_num += 1
              end
              sleep(5)
          rescue StandardError => OpenURI::HTTPError
            puts 'drinkページがないよー'
            sleep(5)
            next
            end
          store_array.push(store_name, store_id, drink_array.to_s.gsub(/^\[|\]$|\\|\"/, ""))
          p store_array
          csv << store_array
        end
      rescue => e
      p e
      puts 'そんなことある！？'
      sleep(5)
      next
    end
      sleep(10)
    end
  end
end

puts '終了'
