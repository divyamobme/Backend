require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'json'
require 'byebug'
set :database, "sqlite3:formdatabase.sqlite3"
set :bind, '0.0.0.0'


get '/index' do
	@register=Register.all
content_type :json
@register.to_json
end




post '/userinfo' do

#byebug

@register=Register.new
@register.name=params[:name]
@register.email=params[:email]
@register.password=params[:password]
@register.save
#imgdata=params[:imageData]
#@register=Register.find_by(:name=>params[:name])
#@register=Register.find(3)
#@register=Register.find(3)
#content_type :json
#@register.to_json
end


