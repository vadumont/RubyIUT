#  journal.rb
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

module Codex
	class Journal
		def initialize(entries)
			@entries = entries
		end
		

		def count
			count = entries.size
		end
		

		def add_entry(entry)
			entry.id = count + 1
			if(!entries.include?(entry))
				entries << entry
			end
		end

		def load(path)
			loader = Codex::Loader.new(path)
			entries = loader.entries
		end

		def remove(idTest)
			entries.each do |elem|
				if(elem.id = idTest)
					entries.delete(elem)
				end
			end
		end

		public
		attr_reader :entries
	end
end

