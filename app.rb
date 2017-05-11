require 'sinatra'

	get '/' do
		erb:name
	end

	post '/name' do
		name = params[:name]
		redirect 'age?name='+ name
	end
	get '/age' do
		name = params[:name]
		erb :age, locals:{name:name}
	end

	post '/age' do
	 	name = params[:name]
	 	age = params[:age]
	  	redirect "numbers?name=#{name}&age=#{age}"
	 end

	 get '/numbers' do
	 	name = params[:name]
	 	age = params[:age]
	  	erb :numbers, locals:{name:name, age:age}
	 end

	 post '/numbers' do
	 	name = params[:name]
	 	age = params[:age]
	  	num1 = params[:num1]
	 	num2 = params[:num2]
	 	num3 = params[:num3]
	 	redirect "results?name=#{name}&age=#{age}&num1=#{num1}&num2=#{num2}&num3=#{num3}"
	 end

	 get '/results' do
		name = params[:name]
	 	age = params[:age]
	  	num1 = params[:num1]
	 	num2 = params[:num2]
	 	num3 = params[:num3]
	 	erb :results, locals:{name:name, age:age, num1:num1, num2:num2, num3: num3}
	 end
