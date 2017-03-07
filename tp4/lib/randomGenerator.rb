#  randomGenerator.rb
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
require 'generator'

class RandomGenerator < Generator
	def initialize
		
	end
	
	def generate(size:)
		chars = "abcdefghijklmnopqrstuvwxyz1234567890".chars
		tmp = []
		dico = []
		mot = ""
		
		
		for a in chars
			for b in chars
				for c in chars
					for d in chars
						for e in chars
							for f in chars
								mot = a+b+c+d+e+f
								puts mot
								dico << mot
							end
						end
					end
				end			
			end
		end
		puts dico
		
		
	end
	
	
	public 
	attr_reader :dico
	
end
