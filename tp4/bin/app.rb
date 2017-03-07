#  app.rb
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

#!/usr/bin/env ruby

$LOAD_PATH.unshift(
	File.join(
		File.dirname(__FILE__),
			'..',
			'lib'
	)
)

require 'client'
require 'pwdtestor'
require 'crack'
require 'distributor'
require 'generator'
require 'dicogenerator'

if(ARGV.count < 2)
	raise 'Bad Arguments : ruby bin/app.rb <URL:port> <Number of thread> <Number of element to test by thread> <-v if you want to see all of the element tested>'

end

client = Client.new(uri:ARGV[0])

dico = DicoGenerator.new(file: 'american-english')

pwdtestor = PwdTestor.new(client: client)

crack = Crack.new(testor: pwdtestor)

distri = Distributor.new(nbThread: 1,dico: dico)

threads = []

puts "\nEn cours de hack ..."

if(ARGV[3] == '-v')
				

	while(1) do

		for i in 0..ARGV[1].to_i

		threads << Thread.new do 
				res = distri.get(n: ARGV[2].to_i)
	
				puts res
			
				crack.bruteforce(pwds: res)
			end

		end

		threads.each { |t| t.join }

	end
end

while(1) do

		for i in 0..ARGV[1].to_i

		threads << Thread.new do 
				res = distri.get(n: ARGV[2].to_i)
			
				crack.bruteforce(pwds: res)
			end

		end

		threads.each { |t| t.join }

	end
