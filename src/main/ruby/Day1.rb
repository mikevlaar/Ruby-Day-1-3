puts 'Hello World!'

puts 'Hello, Ruby.'.index('Ruby')

i = 1
name = 'Mike'

while i < 11
	puts name
	puts 'This is sentence number ' + i.to_s + '.'
	i = i + 1
end


number = rand(10)
guesed = false
while guesed == false
	puts
	puts 'Gues a Number: '
	input = gets.to_i

	unless input == number
		if input > number
			puts 'The number is too high!'
		else
			puts 'The number is too low!'
		end
	else
		puts 'You guesed the number!'
		guesed = true
	end
end
