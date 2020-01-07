require 'test_helper'

class CardControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get card_create_url
    assert_response :success
  end

  test "should get destroy" do
    get card_destroy_url
    assert_response :success
  end

  test "should get index" do
    get card_index_url
    assert_response :success
  end

end
