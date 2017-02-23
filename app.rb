require 'sinatra'

class PersonalDetailsApp < Sinatra::Base
	
	get '/' do
		erb:name
	end

	post '/name' do
		name = params[:name]
		redirect 'age?name='+ name
	end
	get '/age' do
		name = params[:name]
		erb :age, locals:{name: name}
	end

	post '/age' do
	 	name = params[:name]
	 	age = params[:age]
	  	redirect "results?name=#{name}&age=#{age}"
	 end

	 get '/results' do
	 	name = params[:name]
	 	age = params[:age]
	  	erb :results, locals:{name:name, age:age}
	 end

end