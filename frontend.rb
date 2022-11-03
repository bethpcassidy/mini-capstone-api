rquire "http"

option1 = "1 for catalog"
option2 = "2 for product search"
option3 = "3 for plushies"
option4 = "back"
input = 0

while input != 3
  puts "~welcome to the store~"
  puts option1
  puts option2
  puts option3
  input = gets.chomp
  if input == 1
    response = HTTP.get("")
  elsif input == 2
    response = HTTP.get("")
  elsif input == 3
    response = HTTP.get("")
  end
end
