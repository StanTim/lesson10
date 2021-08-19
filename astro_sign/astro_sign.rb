if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

#программа "ГОРОСКОП"
# Выдаёт описания знаков зодиака в за-
# висимости от даты рождения пользователя

require 'json'
require 'date'

file = File.read('signs.json', encoding: "utf-8")
signs = JSON.parse(file)

puts "Когда вы родились? (укажите дату в формате ДД.ММ, напримет 08.03)"
input_data = STDIN.gets.chomp

user_birth_date = Date.parse(input_data + '.2000')

user_sign = nil

signs.each do |key, sign|
  dates = sign['dates'].split('..')

  if (Date.parse(dates[0] + '.2000') <= user_birth_date) &&
      (user_birth_date <= Date.parse(dates[1] + '.2000'))

  user_sign = sign
  end
end

puts user_sign['dates']
puts user_sign['text']