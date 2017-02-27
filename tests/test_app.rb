require "minitest/autorun"
require "rack/test"
require_relative'../app.rb'

class TestApp < Minitest::Test
	include Rack::Test::Methods

	def app
		PersonalDetailsApp
	end	

	def test_get_test_entry_page
		get '/'
		assert(last_response.body.include?('Hello, whats your name?'))
		assert(last_response.body.include?('<input type="text" name="name">'))
		assert(last_response.body.include?('<form method="post" action ="name">'))
		assert(last_response.ok?)
	end

	def test_post_name
		post '/name', name:'Dov'
		follow_redirect!
		assert(last_response.body.include?('Dov'))
		assert(last_response.ok?)		
	end

	 def test_get_age
		get '/age?name= Dov'
		assert(last_response.ok?)
		assert(last_response.body.include?('Dov'))
	end

	def test_post_age
		post '/age', name:'Dov', age:'32'
		follow_redirect!
		assert(last_response.ok?)	
		assert(last_response.body.include?('Dov'))
		assert(last_response.body.include?('32'))
		
	end

	def test_get_numbers
		get '/numbers?name=Dov&age=32'
		assert(last_response.body.include?('Dov'))
		assert(last_response.body.include?('32'))
		assert(last_response.ok?)
	end

	def test_post_numbers
		post '/numbers', name:'Dov', age:'32', num1:'11', num2:'22', num3:'33'
		follow_redirect!
		assert(last_response.ok?)	
		assert(last_response.body.include?('Dov'))
		assert(last_response.body.include?('32'))
		assert(last_response.body.include?('11'))
		assert(last_response.body.include?('22'))
		assert(last_response.body.include?('33'))
	end

	def test_get_results
		get '/results?name= Dov&age=32&num1=11&num2=22&num3=33'
		assert(last_response.ok?)
		assert(last_response.body.include?('Dov'))
		assert(last_response.body.include?('32'))
		assert(last_response.body.include?('11'))
		assert(last_response.body.include?('22'))
		assert(last_response.body.include?('33'))
	end


end
