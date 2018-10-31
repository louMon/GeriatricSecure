require 'test_helper'

class RegistroConsultaControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get registro_consulta_new_url
    assert_response :success
  end

  test "should get show" do
    get registro_consulta_show_url
    assert_response :success
  end

end
