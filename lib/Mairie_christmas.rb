require 'nokogiri'
require 'open-uri'


def get_townhall_email(url)
	page = Nokogiri::HTML(open(url))
	return page.css(".tr-last")[3].text.split[2]
end 


def get_townhall_urls
	page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
	return page.css(".lientxt").each do |link| # prend les liens un par un pour aller récupérer l'email
	url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
	nom_villes = link.text 
	email_villes = get_townhall_email(url) # on fait appel à la première méthode pour récupérer l'email
	final = {nom_villes => email_villes}
	puts final
end 
end


get_townhall_urls

