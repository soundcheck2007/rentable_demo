require "test_helper"

class RentableControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rentable_index_url
    assert_response :success
  end
end
