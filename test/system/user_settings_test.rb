require "application_system_test_case"

class SettingsTest < ApplicationSystemTestCase
  setup do
    @setting = settings(:one)
  end

  test "visiting the index" do
    visit settings_url
    assert_selector "h1", text: "User Settings"
  end

  test "creating a User setting" do
    visit settings_url
    click_on "New User Setting"

    click_on "Create User setting"

    assert_text "User setting was successfully created"
    click_on "Back"
  end

  test "updating a User setting" do
    visit settings_url
    click_on "Edit", match: :first

    click_on "Update User setting"

    assert_text "User setting was successfully updated"
    click_on "Back"
  end

  test "destroying a User setting" do
    visit settings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User setting was successfully destroyed"
  end
end
