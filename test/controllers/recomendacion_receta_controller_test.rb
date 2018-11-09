require 'test_helper'

class RecomendacionRecetaControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get recomendacion_receta_edit_url
    assert_response :success
  end

end
