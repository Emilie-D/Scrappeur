require 'nokogiri'
require 'open-uri'

def scrappeur_name
	array_name = []
	page = Nokogiri::HTML(open('https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600'))
	page.xpath("//h2[@class='titre_normal']").each { |n| array_name << n.text}
	return array_name
end

def scrappeur_email
	array_email = []
	page = Nokogiri::HTML(open('https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=600'))
	email = page.xpath("//a[contains(@href, 'mailto')]").each { |n| array_email << n.text}
	return array_email
end 


Hash_final = Hash[scrappeur_name.zip(scrappeur_email)]
array = Hash_final.map { |key, value| { key => value } }

puts array


