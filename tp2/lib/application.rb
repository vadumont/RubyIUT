#!/usr/bin/env ruby

class Application

	def initialize(dictionnaries)
		dictionnaries = dictionnaries
		@dictionnaries = dictionnaries
		
	end
	
	
	def run
	
		dictionnaire = Dictionnary.new(dictionnaries)
		dictionnaire.load_file
		
		puts("\nEntrer votre mot : ")
		
		
		while word = STDIN.gets
		
		words_found = dictionnaire.anagram_of(word)
		puts("\nLes anagrammes sont :")
		puts words_found
		
		puts("\nEntrer votre mot : ")
		
		end
		

	end
	
	private
	attr_reader :dictionnaries

end
