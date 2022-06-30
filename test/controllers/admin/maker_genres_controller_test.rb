require "test_helper"

class Admin::MakerGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_maker_genres_index_url
    assert_response :success
  end
end
