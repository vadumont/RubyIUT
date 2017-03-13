#  moduleMixin.rb
#  
#  Copyright 2017 Valentin <valentin@amadeus>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  

#coding: utf-8

module Unaccent
	
	# Will add the method to_us at any class which include Unaccent
	def to_us
		
		accents = { ['à','â','ä'] => 'a',['Ä','Â','À'] => 'A',
		['é','è','ê','ë'] => 'e', ['Ë','É','È','Ê'] => 'E',
		['î','ï'] => 'i', ['Ï','Î'] => 'I',
		['ô','ö'] => 'o', ['Ö','Ô'] => 'O',
		['ù','û','ü'] => 'u', ['Ü','Û','Ù'] => 'U',
		['ç'] => 'c', ['Ç'] => 'C'}
		str = self.to_s
		
		accents.each do |accent, echange|
			accent.each do |c|
				str.gsub!(c,echange)
			end
			
		end
		return str
	end
	
end

# Class which allow to test the module Unaccent
class Test
	include Unaccent
	# Initializer of th class Test
	# @param phrase [String] phrase to test
	def initialize(phrase)
		@phrase = phrase
	end
	
	def to_s
		return phrase
	end
	
	public
	attr_reader :phrase
	
end
