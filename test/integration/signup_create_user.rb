require "test_helper"

class SignupUserTest < ActionDispatch::IntegrationTest

  test "get signup form and create user account" do
    get signup_path
    
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: "johndoe", email: "johndoe@example.com", password: "password"}
    end
    assert_template 'users/show'
    assert_match "johndoe", response.body
  end

  test "invalid signup submission results in failure" do
    get signup_path
    assert_template 'users/new'
    assert_no_difference 'User.count' do
      post users_path, user: {username: "jo", email: "jo", password: "jo"}
    end
    assert_template 'users/new'
    assert_select "div.messages--errors"
    assert_select "li.messages__item"
  end

end