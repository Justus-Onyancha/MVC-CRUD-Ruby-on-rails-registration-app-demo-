require "test_helper"

class ResourceControllerTest < ActionDispatch::IntegrationTest
  test "should get registers" do
    get resource_registers_url
    assert_response :success
  end

  test "should get index" do
    get resource_index_url
    assert_response :success
  end
end
