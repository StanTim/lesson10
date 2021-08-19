# Программа выводит пользователю первооткрывателя
# химического элемента используя файл *.json
require 'json'

# Чтения файла данных
data = File.read('mendeleev_hard.json')

#
table = JSON.parse(data)

puts "у нас всего элементов: #{table.keys.size}"
puts table.keys
puts "О каком элементе вы хотели бы узнать?"
element = STDIN.gets.chomp

# Если элемент содержится в массиве:
if table.has_key?(element)

  # теперь прочтем в переменную хэш значений
  # для выбранного химического элемента:
  description = table[element]

  # Выведем описания элемента для соответствующих ключей:
  puts "Название: #{description["name"]}"
  puts "Порядковый номер: #{description["number"]}"
  puts "Первооткрыватель: #{description["discoverer"]}"
  puts "Плотность: #{description["density"]} г/см куб."

else
  puts "Извините, про такой элемент мы еще не знаем."
end