require 'nokogiri'
require 'open-uri'

def scrappeur_name
page = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))

url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s

end

def scrappeur_email
end 