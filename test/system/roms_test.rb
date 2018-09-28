require "application_system_test_case"

class RomsTest < ApplicationSystemTestCase
  setup do
    @rom = roms(:one)
  end

  test "visiting the index" do
    visit roms_url
    assert_selector "h1", text: "Roms"
  end

  test "creating a Rom" do
    visit roms_url
    click_on "New Rom"

    fill_in "Nome", with: @rom.nome
    fill_in "User", with: @rom.user_id
    click_on "Create Rom"

    assert_text "Rom was successfully created"
    click_on "Back"
  end

  test "updating a Rom" do
    visit roms_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @rom.nome
    fill_in "User", with: @rom.user_id
    click_on "Update Rom"

    assert_text "Rom was successfully updated"
    click_on "Back"
  end

  test "destroying a Rom" do
    visit roms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rom was successfully destroyed"
  end
end
