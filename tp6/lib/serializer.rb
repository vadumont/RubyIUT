#  serializer.rb
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

require 'personnage'

module Printable
	
	def to_s 
		msg = "{\n\t#{self.class}: {\n\thabilete : #{self.habilete},\n\tpv : #{pv},\n\tchance : #{chance}\n\t}\n}"
	end
end

module Serializable

	@@counter = 0
	
	def initialize
		@@counter += 1
		r = Random.new(1000)
		@ID = r
	end
	
	def write(ioObj)
	
	file = File.open(ioObj,"w")
	msg = "{\n\t#{self.class}: {\n\thabilete : #{self.habilete},\n\tpv : #{pv},\n\tchance : #{chance}\n\t}\n}"
	file.write(msg)
	file.close
	end
	
	public
	attr_reader :counter
	attr_reader :ID
	
end

