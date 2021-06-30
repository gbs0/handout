require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
    def self.parse(url)
        uri = URI.parse(url)
        document = Nokogiri::HTML(open(uri).read)
        instances = []
        document.xpath("//html/body/div[1]/main/div/div[4]/table/tr").each_with_index do |div, index|    
            item = {}
            infos = div.xpath("//tr[1]/td/text()").to_a
            item[:title]                = div.xpath("//td/strong[1]/a")[index].children.text
            item[:summary]              = div.css('.dont-break-out').text
            item[:link]                 = "https://sapl.camaranh.rs.gov.br" + div.xpath("//td/strong[1]/a")[index].attributes["href"].value
            item[:timestamp]            = infos[4].text.strip
            item[:author]               = infos[5].text.strip
            item[:localization]         = infos[6].text.strip
            item[:status]               = infos[7].text.strip
            item[:expiration_date]      = infos[8].text.strip
            item[:last_process_date]    = infos[9].text.strip
            item[:last_process_status]  = infos[10].text.strip

            instances.push(Bill.new(item))
        end
        return instances
    end
end
