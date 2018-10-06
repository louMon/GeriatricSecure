require 'test_helper'

class PathologiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pathology = pathologies(:one)
  end

  test "should get index" do
    get pathologies_url
    assert_response :success
  end

  test "should get new" do
    get new_pathology_url
    assert_response :success
  end

  test "should create pathology" do
    assert_difference('Pathology.count') do
      post pathologies_url, params: { pathology: { cie10_code: @pathology.cie10_code, description: @pathology.description, idpathology: @pathology.idpathology, pathology_name: @pathology.pathology_name } }
    end

    assert_redirected_to pathology_url(Pathology.last)
  end

  test "should show pathology" do
    get pathology_url(@pathology)
    assert_response :success
  end

  test "should get edit" do
    get edit_pathology_url(@pathology)
    assert_response :success
  end

  test "should update pathology" do
    patch pathology_url(@pathology), params: { pathology: { cie10_code: @pathology.cie10_code, description: @pathology.description, idpathology: @pathology.idpathology, pathology_name: @pathology.pathology_name } }
    assert_redirected_to pathology_url(@pathology)
  end

  test "should destroy pathology" do
    assert_difference('Pathology.count', -1) do
      delete pathology_url(@pathology)
    end

    assert_redirected_to pathologies_url
  end
end
