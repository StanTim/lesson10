require 'json'

data = File.read('card.json')

data_hash = JSON.parse(data)

puts data_hash['person']
puts %(#{data_hash['number']}, #{data_hash['email']})
puts data_hash['skills']
#puts data_hash['photo']