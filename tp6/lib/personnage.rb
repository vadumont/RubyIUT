#  personnage.rb
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
require 'serializer'

class Personnage


	include Printable
	
	include Serializable

	def initialize
		@habilete = 6 + jet_de(1)
		@pv = 12 + jet_de(2)
		@chance = 6 + jet_de(1)
	end
	
	
	def jet_de(lances)
		
		valeur = 0
		lances.times do 
			r = Random.rand(6)
			valeur = valeur + r
		end
		valeur
	end
	
	
	def force_attaque
		valeur = habilete + jet_de(2)
	end
	
	
	def encaisse(degats)
		@pv -= degats
	end
	
	public
	attr_reader :habilete
	attr_reader :pv
	attr_reader :chance
	
end

