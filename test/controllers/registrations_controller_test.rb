require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get :devise" do
    get registrations_:devise_url
    assert_response :success
  end
end
