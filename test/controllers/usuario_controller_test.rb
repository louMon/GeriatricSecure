require 'test_helper'

class UsuarioControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get usuario_edit_url
    assert_response :success
  end

end
