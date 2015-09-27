# coding:utf-8
require 'active_record'
require 'mysql2'
require 'sinatra'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(:development)

class Location < ActiveRecord::Base
end

get '/' do
	@locations = Location.all.order('created_at asc').limit(30)
	erb :index
end

post '/' do
	key = @params[:search]	
	if key 
		@locations = Location.where('keywords like ?', "%#{key}%")
	else
		@locations = Location.all.order('created_at asc').limit(30)
	end
	erb :index
end

