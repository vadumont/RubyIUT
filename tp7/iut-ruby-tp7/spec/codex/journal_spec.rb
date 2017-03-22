#  journal_spec.rb
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

require 'spec_helper'
require 'codex/entry'

describe Codex::Journal do
	subject do
		described_class.new(entries)
	end	
	
	let(:entries) do

	end
	
	
	describe '#entries' do
		let(:entries) do
			entries = []
			entries << Codex::Entry.new(id: 404,date: DateTime.now,content:"Article not found")
		end
		let(:entriestest) do
			entries
		end
		
		it 'has the right entry' do
			expect(subject.entries).to eq entriestest
		end
	end
	
	
	describe '#count' do
		let(:entries) do
			entries = []
			entries << Codex::Entry.new(id: 404,date: DateTime.now,content:"Article not found")
		end
		
		let(:count) do
			count = 1
		end
		
		it 'has the right number of entry' do
			expect(subject.count).to eq count
		end
	end
	
	
	describe '#add_entry(entry)' do
		let(:entries) do
			entries = []
			entries << Codex::Entry.new(id: 404,date: DateTime.now,content:"Article not found")
		end

		let(:entriestest) do
			entries << Codex::Entry.new(id: 405,date: DateTime.now,content:"Article 405 not found")
		end
		
		it 'adds the good entry' do
			subject.add_entry(Codex::Entry.new(id: 405,date: DateTime.now,content:"Article 405 not found"))
			expect(subject.entries).to eq entriestest
		end
		
	end

	describe '#load(path)' do
		let(:path) do
			'spec/etc/sample_journal.codex'
		end

		let(:entriestest) do
			
		end

		it 'has the same journal' do
			subject.load(path)
			entriestest = subject.entries
			expect(subject.entries).to eq(entriestest)
		end
	end	
end