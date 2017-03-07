#  server.rb
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

# encoding: UTF-8

require 'webrick'
LETTERS = 'azertyuiopqsdfghjklmwxcvbn0123456789'.chars.freeze

def one_word
  words = File.new('american-english').readlines.map(&:strip)
  return words.sample
end

def random_word(length)
  length.times.map do
    LETTERS.sample
  end.join('')
end

class  Epreuve < WEBrick::HTTPServlet::AbstractServlet
  class << self
    def set_passwd(*pass)
      @keys = pass
      puts pass
      # @memorized = nil
    end

    attr_reader :keys
  end

  def do_GET(req, res)
    choice = nil 
    WEBrick::HTTPAuth.basic_auth(req, res, "Petit Challenge amical") do |user, pass|
      choice = pass
      sleep(0.01)
      self.class.keys.include?(pass) 
    end

    res.body = "Bien!\n   passwd '#{choice}' trouve - #{Time.now}\n"
  end
end

Epreuve.set_passwd 'admin', one_word, random_word(6)

root = File.expand_path('.')

server = WEBrick::HTTPServer.new(:Port => 7654, :DocumentRoot => root)

server.mount_proc '/cachette' do |req, res|
  res.body = "Vous avez trouve une cachette (#{req})" 
end

server.mount "/epreuve", Epreuve

trap 'INT' do server.shutdown end

server.start

