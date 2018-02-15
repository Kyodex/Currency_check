require "nokogiri"
require"open-uri"

class ScrapCurrency

  def initialize(message)
  @message =  message
  end

def perform
get_all_currency ("https://coinmarketcap.com/all/views/all/")
end

  def get_all_currency (web_site)
    h = Hash.new {|currency,value|currency[value]="" }
    page = Nokogiri::HTML(open(web_site))

  for i in (1..350)
    page.xpath("//tr[#{i}]/td[2]/a").each do |currency| # recupère la cryptomonnaie ,
      page.xpath("//tr[#{i}]/td[5]/a").each do |value|# recupère sa valeur
        h[currency.text]=value.text
  $s = "#{currency.text} : #{value.text}" if @message.downcase == currency.text.downcase
        end
      end
    end
  end


end
