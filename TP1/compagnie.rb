#  compagnie.rb
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


class Compagnie

	#Constructeur
	def initialize
		
		@equipe=Array.new
		
	end
	
	#Getter de equipe
	def equipe
		@equipe
	end
	
	#Méthode ajouter une créature à l'équipe
	def ajouter(creature)
		
		if(equipe.any? {|elem| elem.nom==creature.nom})
			
			#levée d'une exception	
			raise "#{creature.nom} deja présente dans la compagnie"
		
		end
		equipe.push(creature)
		creature.compagnie=self
	end
	
	#Suppression d'une créature de l'équipe
	def supprimer(creature)
		
		equipe.delete(creature)
	end

	#Méthode to_string
	def to_s
		
		str = "La compagnie est composée de : \n\n"
		
		equipe.each do |elem|
			str += "#{elem}\n"
		end
		
		str
	end
	
	#Méthode exploration qui raconte l'histoire
	def exploration
	
		puts "--- Histoire ---\n\n"
		
		#1)
		equipe.first.encaisser(10)
		puts "#{equipe.first.nom} pose le pied sur une dalle de couleur différente des autres et encaisse 10 dégats. \n\n"
		
		#2)Gérer les morts : patron Obesrvable
		
		#3)
		
		zak = equipe.detect do |element|
			element.nom == 'Zak'
		end
		
		equipe.delete(zak)
		equipe.unshift(zak)


		#4)
		equipe.insert(3,equipe[1])
		equipe.delete_at(1)
		puts "Gruk, blessé, laisse la place à son frère.\n\n"
		
		
		#5)
		equipe[1].encaisser(14)
		puts "Une trappe s'ouvre sous les pieds de #{equipe[1].nom} (le gobelin de tête étant trop léger pour activer le piège). Il encaisse 14 dégats.\n\n"
		
		
		#6)
		equipe.each do |elem|
			elem.soigner(5)
		end
		puts "Le groupe trouve une potion de soins et la fait boire à celui qui a le moins de points de vie (+5pv).\n\n"
		
		
		#7)
		equipe.each do |elem|
			elem.encaisser(10)
		end
		puts "Au détour d'un couloir mal éclairé, la première créature marche sur une rune étrange sournoisement dissimulée sous un tapis. le groupe entier encaisse 10 dégats mais s'embrase de façon très esthétique.\n\n"

		
		#8)
		pv_max=0
		equipe.each do |elem|
			pv_max = pv_max + elem.vie
		end

		degat = (pv_max * 15)/100
		
		equipe.each do |elem|
			elem.encaisser(degat)
		end
		
		
		#9)
		
		equipe.sort_by! do |element|
			- element.vie
		end
					
		puts "Les survivants sont :"
		
		equipe.each do |elem|
			puts elem.nom
		end
		
		puts "\nIls se rangent par ordre décroissant de leur PV et chargent !\n\n"
		
		
		#10)
		puts "Le groupe arrive enfin a portée de massue de Zangdar. Celui ci lance successivement cinq rayons lunaires qui viennent tour à tour frapper le premier du groupe, lui infligeant 5 points de dégats par rayon. "
		
		5.times do 
			equipe.first.encaisser(5)
		end
		
		puts "Zangdar fait un échec critique après le cinquième sort lancé et se bannit tout seul dans les limbes.\n\n"
		

		#11)
		puts "Il reste #{equipe.count} survivants.\n\n"
		
		
		#12)
		nb = 0
		equipe.each do |elem|
			if(elem.vie > 3)
				nb = nb + 1
			end
		end
		
		puts "Il reste #{nb} créatures qui ont plus de 3 PV.\n\n"
		
		
	end

end
