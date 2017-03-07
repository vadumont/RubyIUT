#  forge.rb
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

require_relative "troll"
require_relative "gobelin"
require_relative "compagnie"

class Fabrique

	def initialize
	
	end
	
	#récupération du fichier
	def creer_compagnie(nom_fichier,compagnie)
	
		fichier = File.open(nom_fichier,"r")
		fichier = fichier.read
		fichier = fichier.split("\n")
		
		nombre_elem = fichier.count
		
		for i in 0..nombre_elem-1
		
			ligne = fichier[i]
			
			j = 0
			
			classe = ""
			nom = ""
			vie = ""
			
			#boucle pour récupérer la classe
			while(ligne[j] != " ")
			
				classe << ligne[j]
				j = j + 1
				
			end
						
			j = j + 1
						
			#boucle pour récupérer le nom
			while(ligne[j] != " ")
			
				nom << ligne[j]
				j = j + 1
				
			end
			
			j = j + 1
						
			
			#boucle pour récupérer l'age
			while(ligne[j] != nil)
			
				vie << ligne[j].to_s
				j = j + 1
			end
			
			vie = vie.to_i
			
			fabriquer_monstre(classe,nom,vie,compagnie)
			
		end	
	end
	
	
	#fabrique de monstre
	def fabriquer_monstre(monstre,nom,pv,compagnie)
	
	monstre = monstre.downcase
	
		case monstre
		
			when "troll"
				compagnie.ajouter(Troll.new(nom,pv))
			
			when "gobelin"
				compagnie.ajouter(Gobelin.new(nom,pv))
			
			else
				raise "#{monstre} n'est pas une créature valide ! Merci de choisir entre Troll ou Gobelin. \n\n"
		end				
	
	end

end


