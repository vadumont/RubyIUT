#!/usr/bin/env ruby

$LOAD_PATH.unshift(
	File.join(
		File.dirname(__FILE__),
			'..',
			'lib'
	)
)

require 'codex'
require 'thor'


class MyCLI < Thor



	desc "list","list all of the entries"
	def list
		entriesSelf = Codex::Loader.new('spec/etc/sample_journal.codex').entries
		entriesSelf.each do |elem|
			p elem.to_s
		end
	end

	desc "add CONTENT","add CONTENT to entries"
	def add(content)
		entriesSelf = Codex::Loader.new('spec/etc/sample_journal.codex').entries
		journal = Codex::Journal.new(entriesSelf)
		entry = Codex::Entry.new(id: 0, date: DateTime.now, content: content)
		journal.add_entry(entry)
		p entry.to_s 
		p "Bien ajoutée !"
	end

	desc "count", "give the size of the journal"
	def count
		entriesSelf = Codex::Loader.new('spec/etc/sample_journal.codex').entries
		journal = Codex::Journal.new(entriesSelf)
		p journal.count
	end

	desc "remove ID","remove the entry by ID"
	def remove(id)
		entriesSelf = Codex::Loader.new('spec/etc/sample_journal.codex').entries
		journal = Codex::Journal.new(entriesSelf)
		journal.remove(id)
	end

	public
	#attr_accessor :entriesSelf
	attr_accessor :journal

end


MyCLI.start(ARGV)