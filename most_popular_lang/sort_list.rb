require 'json'

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Прочтём файл данных
data = File.read('list.json')

# Прочтём файл в ассоциативный массив
data_hash = JSON.parse(data)

# Сортировка хэша по убыванию значений:
sort_arr = data_hash.sort_by{|k,v| v}
#puts data_hash.to_s
#data_hash.sort_by{|_, value| value}
#puts data_hash
sort_arr.reverse!
# переменная для списка языков
number = 1

# Вывод самого популярного ЯП
most_popular = sort_arr.first
puts "Cамый популярный язык: #{most_popular.last} (#{most_popular.first})"

# Вывод нумерованного списка ЯП
sort_arr.each do |item|

    puts "#{number}: #{item}"
    number += 1
  end

#puts data_hash.to_s

