#  app.rb
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

#coding: utf-8

#!/usr/bin/env ruby

$LOAD_PATH.unshift(
	File.join(
		File.dirname(__FILE__),
			'..',
			'lib'
	)
)

require 'moduleMixin'

t = Test.new('Cécî èst ùne phräse')
puts t.to_us

#str = String.new('Cécî èst ùne phräse')
#puts str.to_us
