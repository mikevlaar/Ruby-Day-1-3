require 'test/unit'
require_relative '../../main/ruby/Day2'

class Day2Test < Test::Unit::TestCase
	def test_NumbersShouldContainSixteenNumbers
    	day2 = Day2.new
		assert_equal(16, day2.numbers.size)
    end
	
    def test_NumberOfLinesShouldBe3WhenLookingForRuby
    	day2 = Day2.new
		lines = day2.grep("Ruby", "../../../res/Text.txt")
		assert_equal(3, lines.size)
    end
end