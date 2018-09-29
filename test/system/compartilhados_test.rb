require "application_system_test_case"

class CompartilhadosTest < ApplicationSystemTestCase
  setup do
    @compartilhado = compartilhados(:one)
  end

  test "visiting the index" do
    visit compartilhados_url
    assert_selector "h1", text: "Compartilhados"
  end

  test "creating a Compartilhado" do
    visit compartilhados_url
    click_on "New Compartilhado"

    fill_in "Nome", with: @compartilhado.nome
    click_on "Create Compartilhado"

    assert_text "Compartilhado was successfully created"
    click_on "Back"
  end

  test "updating a Compartilhado" do
    visit compartilhados_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @compartilhado.nome
    click_on "Update Compartilhado"

    assert_text "Compartilhado was successfully updated"
    click_on "Back"
  end

  test "destroying a Compartilhado" do
    visit compartilhados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Compartilhado was successfully destroyed"
  end
end
