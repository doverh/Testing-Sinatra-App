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
		assert(last_response.ok?)
		assert(last_response.body.include?('Hello, whats your name?'))
		assert(last_response.body.include?('<input type "text" name="name">'))
		assert(last_response.body.include?('<form method="post" action ="name">'))
	
	end

	def test_post_name
		post '/name', name:'Jon'
		follow_redirect!
		assert(last_response.ok?)
		assert(last_response.body.include?('Jon'))
		
	end

	def test_get_age
		get '/age?user_name = Dover'
		assert(last_response.ok?)
		assert(last_response.body.include?('Dover'))
	end

end
