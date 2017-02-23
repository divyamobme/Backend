require 'rubygems'
require 'sinatra'
require 'json'

get '/hi' do
  "Hello World!"
end

get '/' do
  "Hello World #{params[:name]}".strip
end

post '/echo' do
   data = JSON.parse request.body.read.to_s
    "Hello !\n#{data.to_s}"
end