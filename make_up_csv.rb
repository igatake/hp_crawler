require 'csv'

header = %w[name url drinks]
rows = {}
CSV.foreach('./lib/result_ikebukuro_20190217-013308.csv', headers: true) do |row|
  rows[row['url']] = row if !rows.key?(row['url']) 
end

CSV.open('./lib/new_result_ikebukuro_20190217-0133081.csv','w') do |newcsv|
  newcsv << header
   rows.each_value do |row|
      newcsv << row
   end
end