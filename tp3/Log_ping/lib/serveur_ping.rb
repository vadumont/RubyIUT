#  serveur_ping.rb
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

require 'open3'

class ServeurPing

	#Constructeur de la classe ServeurPing
	#Initialise le serveur, le nombre d'éléments du tableau et le fichier à ouvrir
	def initialize(serveur:,n:)
		
		@serveur = serveur
		@n = n.to_i
		@file = File.open("log_ping.txt","w")
		
	end
	
	#Lance la ou les requête(s) ping sur le @serveur puis fais appel à la méthode count_board
	def launch_ping()
		board = []
		cmd = 'ping '+serveur
		
		Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
			while line = stdout.gets
				
				puts line
				if(!line.start_with?('P'))
				
					time = line.gsub(/.*(time=)(\d+).*/,'\2')
				
					if(board.count == n)
						Process.kill("KILL",wait_thr.pid)
					end

					time.to_i
					board.push(time)
				end
				
			end
			
			avg = count_board(tab: board,size: board.count)
		end
	end
	
	
	#Calcule la moyenne d'un tableau
	def count_board(tab:,size:)
		
		avg = 0
		
		tab.each do |elem|
			avg = avg + elem.to_i
		end

		avg = avg/size
		
		puts "\nLa moyenne de la requete ping est de #{avg} ms\n"
		
		write_result(avg: avg)
	
	end
	
	
	#Ecrit dans un fichier la date, l'heure et la moyenne trouvée
	def write_result(avg:)
	
		time = Time.now
		file.write time
		file.write " , "
		file.write avg

	end
	
	
	public
	attr_reader :serveur
	attr_reader :n
	attr_reader :file
	
end
