require 'test_helper'

class CompartilhadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compartilhado = compartilhados(:one)
  end

  test "should get index" do
    get compartilhados_url
    assert_response :success
  end

  test "should get new" do
    get new_compartilhado_url
    assert_response :success
  end

  test "should create compartilhado" do
    assert_difference('Compartilhado.count') do
      post compartilhados_url, params: { compartilhado: { nome: @compartilhado.nome } }
    end

    assert_redirected_to compartilhado_url(Compartilhado.last)
  end

  test "should show compartilhado" do
    get compartilhado_url(@compartilhado)
    assert_response :success
  end

  test "should get edit" do
    get edit_compartilhado_url(@compartilhado)
    assert_response :success
  end

  test "should update compartilhado" do
    patch compartilhado_url(@compartilhado), params: { compartilhado: { nome: @compartilhado.nome } }
    assert_redirected_to compartilhado_url(@compartilhado)
  end

  test "should destroy compartilhado" do
    assert_difference('Compartilhado.count', -1) do
      delete compartilhado_url(@compartilhado)
    end

    assert_redirected_to compartilhados_url
  end
end
