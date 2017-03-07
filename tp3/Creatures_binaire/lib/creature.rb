#  creature.rb
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


class Creature
	def initialize(name:,tribu:,race:,life:,gold:)
	
		@name = name
		@tribu = tribu
		@race = race_definition(race: race)
		@life = life
		@gold = gold
		
	end
	
	def race_definition(race:)
	
		race = case race
		
			when 0
				"Troll"
			when 1
				"Humain"
			when 2
				"Elfe"
			when 3
				"Vulcain"
			when 4
				"Wookie"
			when 5
				"Gobelin"
			else 
				"Not defined"
		end
	
	end
	
	def to_s
		"Le monstre #{name} appartient à la tribu #{tribu}, est un #{race}, a #{life} point(s) de vie et dispose de #{gold} pièce(s) d'or !\n"
	end
	
	public
	attr_reader :name
	attr_reader :tribu
	attr_reader :race
	attr_reader :life
	attr_reader :gold
	
end


