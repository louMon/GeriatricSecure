require 'test_helper'

class HistoriaClinicasControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get historia_clinicas_show_url
    assert_response :success
  end

  test "should get edit" do
    get historia_clinicas_edit_url
    assert_response :success
  end

end
