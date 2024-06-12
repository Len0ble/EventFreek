require "test_helper"

class EvenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get even_index_url
    assert_response :success
  end

  test "should get new" do
    get even_new_url
    assert_response :success
  end

  test "should get show" do
    get even_show_url
    assert_response :success
  end
end
