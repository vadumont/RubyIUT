#  connexion.rb
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
require 'net/http'

class Client
	def initialize(uri:)
		@uri = URI(uri)
	end
	
	def try_connect
		res = Net::HTTP.get(uri)
		puts res
	end
	
	def get(path:, user:, pwd:)
		url = uri.dup
		url.path = path
		
		req = Net::HTTP::Get.new(url)
		req.basic_auth(user,pwd)
		res = Net::HTTP.start(uri.hostname, uri.port) {|http|
			http.request(req)
		}
		if(res.is_a?(Net::HTTPOK))
			puts "\nAttaque par forcebrute réussie ! Le password était #{pwd}\n\nPage retournée :\n\n"
			puts res.body
			abort			
		end			
	end
	
	
	public
	attr_reader :uri
	
end

