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

	def initialize(nom, vie)
		
		@nom = nom
		@vie = vie
		
	end
	
	#Setter de nom
	def nom=(nom)
		@nom = nom
	end
	
	#Getter de nom
	def nom
		@nom
	end
	
	#Setter de vie
	def vie=(vie)
		@vie = vie
	end
	
	#Getter de vie
	def vie
		@vie
	end
	
	#Getter de compagnie
	def compagnie
		@compagnie
	end
	
	#Setter de compagnie
	def compagnie=(compagnie)
		@compagnie = compagnie
	end
	
	
	#Méthode encaisser des dégats
	def encaisser(degat)
		@vie = vie-degat
		
		if(vie <=0)
			if compagnie
				compagnie.supprimer(self)
			end
		end
	end
	
	#Méthode soigner des pv
	def soigner(pv)
		@vie = vie + pv
	end
	
	#Méthode to_string
	def to_s
		"Le monstre #{nom} a #{vie} point(s) de vie !\n"
	end
	
	
end



