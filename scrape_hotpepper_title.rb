require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'anemone'
require 'kconv'
require 'csv'

time = Time.now.strftime('%Y%m%d-%H%M%S')
header = %w[name url drinks]
url = 'https://www.hotpepper.jp/yoyaku/SA11/Y050/'

CSV.open("./lib/result_ikebukuro_#{time}.csv", 'a') do |csv|
  csv << header

  Anemone.crawl(
    url, skip_quary_strings: true, delay: 10, user_agent: 'Mac Safari 4'
  ) do |anemone|
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

        store_array = []

        # 店舗記載のブロックを取得
        stores = doc.xpath(
          "//div[@class='shopDetailText']"
        )

        stores.each do |store|
          # 店舗名取得
          store_name = store.xpath(
            ".//a[@class='fs18 bold lh22 marB1']"
          ).text

          # 店舗id取得
          store_id = store.xpath(
            ".//a[@class='fs18 bold lh22 marB1']"
          ).attribute('href').text

          drink_url = "https://www.hotpepper.jp#{store_id}drink/"
          drink_num = 1
          drink_array = []
          sleep(5)

          begin
              doc_drink = Nokogiri::HTML(URI(drink_url).read, nil, 'utf-8')

              # drinkメニューHTML取得
              drinks = doc_drink.xpath(
                "//div[@class='shopInner']/h3"
              )

              drinks.each do
                # drink名取得
                drink_name = doc_drink.xpath(
                  "//h3[#{drink_num}]"
                ).text

                # drink値段取得
                drink_price = doc_drink.xpath(
                  "//dl[@class='price' and position()=#{drink_num}]/dd"
                ).text

                drink = drink_name, [drink_price]
                drink_array.push(drink)
                drink_num += 1
              end
              sleep(5)
          rescue StandardError => OpenURI::HTTPError
            puts 'drinkページがないよー'
            sleep(5)
            next
            end
          store_data = [store_name, store_id, drink_array]
          puts store_data
          store_array.push(store_data)
          puts store_array
        end
      rescue StandardError => OpenURI::HTTPError
        puts 'そんなことある！？'
        sleep(5)
        next
      end
      store_array.each do |item|
        csv << item
      end
      sleep(10)
    end
  end
end

puts '終了'
