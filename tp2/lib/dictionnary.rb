#!/usr/bin/env ruby
class Dictionnary

	def initialize(path)
		@path = path
	end
	
	def load_file
	
		@reference = {}
		words = File.readlines(path).map(&:strip)
		words.each do |word|
			key = word.chars.sort.join
			unless reference.has_key?(key)
				reference[key] = []
			end
			reference[key] << word
		end
		
	end
	
	def anagram_of(word)

		word_sort = word.split("").sort.join.strip
		if(reference.has_key?(word_sort))
			words_found = reference[word_sort]
		end

		words_found
	
	end
	
	private 
	attr_reader :path
	attr_reader :reference

end
