require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should register new user" do
    get :create, user: { name: 'John', email: 'john@example.com', password: '123456', password_confirmation: '123456' }

    user = User.find_by_name_and_email('John', 'john@example.com')
    expect(user).to exist
  end

end
