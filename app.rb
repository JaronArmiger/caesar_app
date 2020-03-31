require 'sinatra'
require 'sinatra/reloader' if development? 
require 'erb'
require_relative 'caesar.rb'

get '/caesar' do
	erb :caesar
end

post "/caesar" do
	@string = params["string"]
	p @string
	@encoded = caesar_cipher(@string, 5)
	p @encoded
	erb :caesar
end



