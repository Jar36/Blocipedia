require 'test_helper'

class CollaborationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get collaborations_new_url
    assert_response :success
  end

end
