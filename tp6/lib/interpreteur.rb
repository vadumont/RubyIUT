#  classLoader.rb
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


class Interpreteur
	def initialize(path)
		@file = File.open(path,"r")
	end
	
	def load_class
		lign = file.readline()
		puts lign
		puts lign.class
		if m = lign.match(/classe (\w+)/)
			cla = m[1]
		end
		lign = file.readline()
		puts lign
		while !lign.start_with?('fin classe')
			
		end
		
		
	end
	
	public
	attr_reader :path
	attr_reader :file
end
