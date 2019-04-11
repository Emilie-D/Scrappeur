require 'nokogiri'
require 'open-uri'


def name_of_crypto
crypto_name_array = []
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) # ouvrir l'URL avec Nokogiri et le stocker dans un objet "page" 
page.css("span.currency-symbol").each { |n| crypto_name_array << n.text}
#return nom_crypto = n.text
return crypto_name_array
end


def price_of_crypto
crypto_price_array = []
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) # ouvrir l'URL avec Nokogiri et le stocker dans un objet "page"
page.css(".price").each { |i| crypto_price_array << i.text}
#prix_crypto = i.text
return crypto_price_array
#nom_crypto = name_of_crypto
#final = {:nom => nom_crypto,:prix => prix_crypto}
	#puts final
end


#price_of_crypto

Hash_final = Hash[name_of_crypto.zip(price_of_crypto)]
#puts Hash_final
#hash = Hash[symbol_cryptocurrency.zip value_cryptocurrency]
array = Hash_final.map { |key, value| { key => value } }

puts array
