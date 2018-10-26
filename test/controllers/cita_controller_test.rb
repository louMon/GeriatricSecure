require 'test_helper'

class CitumControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cita_index_url
    assert_response :success
  end

  test "should get new" do
    get cita_new_url
    assert_response :success
  end

  test "should get show" do
    get cita_show_url
    assert_response :success
  end

  test "should get edit" do
    get cita_edit_url
    assert_response :success
  end

end
