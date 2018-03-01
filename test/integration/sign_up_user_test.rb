require 'test_helper'

class SignUpUserTest < ActionDispatch::IntegrationTest

	def setup

	end

	test "should increase users count by 1 and redirect to user show page" do
		get signup_path
		assert_difference 'User.count', 1 do
			post users_path, params: {user: {username: "Aaa", email: "aa@gmail.com", password: "123"} }
			follow_redirect!
		end
		assert_template 'users/show'
	end

end