#!/usr/bin/env ruby

$LOAD_PATH.unshift(
	File.join(
		File.dirname(__FILE__),
			'..',
			'lib'
	)
)
	
require 'dictionnary'
require 'application'

puts "\nBienvenue dans le programme Anagram ! \n"

arg = ARGV[0]

puts "\nLe dictionnaire choisi est : #{arg}\n"

appli = Application.new(arg)
appli.run
