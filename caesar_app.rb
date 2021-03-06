
require 'sinatra'
require 'sinatra/reloader' if development? 
require 'erb'


get '/' do
	@string = params["string"]
	@offset = params["offset"]
	erb :index
end


class Caesar
	def caesar_cipher(string, num)
		new_string = ""
		string.length.times do |i|
			if string[i] =~ /[a-z]/
				char_code =  string[i].ord
				new_char_code = char_code + num
				if new_char_code > 122
					new_char_code = 97 + (new_char_code - 123)
				end
				new_char = new_char_code.chr
			elsif string[i] =~ /[A-Z]/
				char_code = string[i].ord
				new_char_code = char_code + num
				if new_char_code > 90
					new_char_code = 65 + (new_char_code - 91)
				end
				new_char = new_char_code.chr
			else
				new_char = string[i]
			end
			new_string[i] = new_char
		end
		new_string
	end
end

#puts caesar_cipher("What a string!", 5)
