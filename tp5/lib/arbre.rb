#  arbre.rb
#  
#  Copyright 2017 Valentin Dumont <vadumont2@b12-233>
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


class Arbre
	def initialize(elem:)
		@elemG = nil
		@elemD = nil
		@elem = elem
		
	end
	
	def insert(elemN:)
		if(elemN < elem)
			if(elemG.nil?)
				@elemG = Arbre.new(elem: elemN)
			else
				@elemG.insert(elemN: elemN)
			end
		end
		
		if(elemN > elem)
			if(elemD.nil?)
				@elemD = Arbre.new(elem: elemN)
			else
				@elemD.insert(elemN: elemN)
			end
		end
		
		if(elemN == elem)
			raise "#{elem} est déjà présent dans l'arbre !"
		end
	end
	
	
	def to_s
		"#{elem} => [#{elemG} ; #{elemD}]"
	end

	public 
	attr_accessor :elemG
	attr_accessor :elemD
	attr_accessor :elem
	
end

