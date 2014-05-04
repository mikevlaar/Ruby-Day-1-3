#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
	attr_accessor :headers, :csv_contents
    
	def initialize
      read 
    end
	
    def read
      @csv_contents = []
	  fileLocation = "../../../res/"
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(fileLocation + filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        csv_rows = row.chomp.split(', ')
		@csv_contents << CsvRow.new(@headers, csv_rows)
      end
    end
	
	def each(&block)
		@csv_contents.each &block
	end
  end
end

class CsvRow
	attr_accessor :headers, :row
	
	def initialize(headers, row)
		@headers = headers
		@row = row
	end
	
	def method_missing(name, *args)
		if @headers.index(name.to_s) != nil
			@row[@headers.index(name.to_s)]
		end
	end
end

class RubyCsv  # no inheritance! You can mix it in
	include ActsAsCsv
	acts_as_csv
end

csv = RubyCsv.new
csv.each {|row| puts row.one}