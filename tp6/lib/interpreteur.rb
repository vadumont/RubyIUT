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

require 'personnage'
require 'serializer'

class Interpreteur
	def initialize(path)
		@file = File.open(path,"r")
		@tabObj = []
	end
	
	def load_class
		lign = file.readline()
		
		while lign.start_with?('classe')
		
			if m = lign.match(/classe (\w+)/)
				cla = m[1].chomp
			end

			Object.const_set(cla, Class.new(Personnage))
		
			lign = file.readline()
		
			while !lign.start_with?('finclasse')
				
				tab = lign.chomp.split
				meth = lign.match(/(\w+)(\w*)/)
				tab.shift
		
				Object.const_get(cla).class_eval("define_method(:#{meth})#{tab.join}")
				lign = file.readline()
			end
		
		end
		
			while !file.eof?

				lign = file.readline()
			
				tab = lign.chomp.split
				clas = lign.match(/(\w+)(\w*)/)
				tab.shift
				
				fabrique(clas,tab)

			end
			tabObj.each do |elem|
				elem.write("resultat.txt")
			end
			
			puts "Les objets suivants ont été créés, ont été sauvegardés dans resultat.txt et sont accessible dans Interpreteur::tabObj :"
			puts tabObj
		
	end
	
	def fabrique(obj,nom)
		
		if(nom.include?("chance"))
			Object.const_get(obj.to_s).class_eval("define_method(:encaisse){ |degats| r = random(4); if(r == 4); @pv; end; @pv -= degats}")
			res = Object.const_get(obj.to_s).new
			tabObj << res
		
		else
			res = Object.const_get(obj.to_s).new
			tabObj << res
		end
	end

	
	public
	attr_reader :path
	attr_reader :file
	attr_reader :tabObj
end
