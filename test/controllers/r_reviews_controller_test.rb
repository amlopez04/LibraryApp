require "test_helper"

class RReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get r_reviews_index_url
    assert_response :success
  end

  test "should get show" do
    get r_reviews_show_url
    assert_response :success
  end

  test "should get new" do
    get r_reviews_new_url
    assert_response :success
  end

  test "should get edit" do
    get r_reviews_edit_url
    assert_response :success
  end
end
