#  binary_loader.rb
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


class BinaryLoader
	def initialize(path:)
	
		@file = File.open(path,"rb")
		
	end
		
	def read_file
		
		creatures = []
	
		file.read(127)
		
		while !(lign = file.read(57)).nil? && lign.size == 57
			brutName,race,life,gold = lign.unpack('A50CsL')
			brutName.force_encoding(Encoding::UTF_8)
			name, tribu = brutName.split('/')
			cre = Creature.new(name: name, tribu: tribu, race: race, life: life, gold: gold)

			creatures << cre
		end
		
		csv = CsvSerializer.new(path:"monstres.txt")
		csv.write_creature(tab: creatures)
	end

	public
	attr_reader :file
	
end



