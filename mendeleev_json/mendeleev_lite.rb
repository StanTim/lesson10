# Программа выводит пользователю первооткрывателя
# химического элемента используя файл *.json
require 'json'

# Чтения файла данных
data = File.read('mendeleev_lite.json')

#
table = JSON.parse(data)

puts "у нас всего элементов: #{table.keys.size}"
puts table.keys
puts "о каком элементе вы хотели бы узнать?"
element = STDIN.gets.chomp

if table.has_key?(element)
  puts "Первооткрыватель: #{table[element]}"
else
  puts "Извините, про такой элемент мы еще не знаем."
end