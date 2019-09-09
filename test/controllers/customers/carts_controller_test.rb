require 'test_helper'

class Customers::CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_carts_index_url
    assert_response :success
  end

  test "should get destroy" do
    get customers_carts_destroy_url
    assert_response :success
  end

  test "should get update" do
    get customers_carts_update_url
    assert_response :success
  end

  test "should get create" do
    get customers_carts_create_url
    assert_response :success
  end

end
