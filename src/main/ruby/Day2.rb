class Day2  	
	attr_reader :numbers
			
	def initialize()		
		@numbers = (1..16).to_a
	end

	def printInLinesOfFour()		
		numbers.each { |value|
			if(value % 4 == 0)
				p numbers[((value - 4)...value)]
			end
		}
	end
	
	def printInLinesOfFourWithEach_Slice()		
		numbers.each_slice(4) { |value|
			p value
		}
	end
	
	def grep(phrase, filename)
		regexp = Regexp.new(phrase)
		lineNumber = 1
		lines = Array.new
		
		File.foreach(filename) { |line|
			if(regexp =~ line)
				lines.push("#{lineNumber}: #{line}")
			end
			lineNumber = lineNumber + 1
		}
		
		return lines
	end
end

day2 = Day2.new()

puts "Print in lines of four with each."
day2.printInLinesOfFour
puts

puts "Print in lines of four with each_slice."
day2.printInLinesOfFourWithEach_Slice
puts

puts "Print all the lines with the number of the line that contain the word Ruby."
puts day2.grep("Ruby", "../../../res/Text.txt")