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

require 'arbre'

arb = Arbre.new(elem: 5)
arb.insert(elemN: 2)
arb.insert(elemN: 7)
arb.insert(elemN: 6)
arb.insert(elemN: 4)
arb.insert(elemN: 9)
arb.insert(elemN: 1)

puts arb.to_s
