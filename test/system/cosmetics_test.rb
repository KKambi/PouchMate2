require "application_system_test_case"

class CosmeticsTest < ApplicationSystemTestCase
  setup do
    @cosmetic = cosmetics(:one)
  end

  test "visiting the index" do
    visit cosmetics_url
    assert_selector "h1", text: "Cosmetics"
  end

  test "creating a Cosmetic" do
    visit cosmetics_url
    click_on "New Cosmetic"

    fill_in "Carousel", with: @cosmetic.carousel
    fill_in "Category", with: @cosmetic.category
    fill_in "Exp Date", with: @cosmetic.exp_date
    fill_in "Memo", with: @cosmetic.memo
    fill_in "Title", with: @cosmetic.title
    fill_in "User", with: @cosmetic.user_id
    click_on "Create Cosmetic"

    assert_text "Cosmetic was successfully created"
    click_on "Back"
  end

  test "updating a Cosmetic" do
    visit cosmetics_url
    click_on "Edit", match: :first

    fill_in "Carousel", with: @cosmetic.carousel
    fill_in "Category", with: @cosmetic.category
    fill_in "Exp Date", with: @cosmetic.exp_date
    fill_in "Memo", with: @cosmetic.memo
    fill_in "Title", with: @cosmetic.title
    fill_in "User", with: @cosmetic.user_id
    click_on "Update Cosmetic"

    assert_text "Cosmetic was successfully updated"
    click_on "Back"
  end

  test "destroying a Cosmetic" do
    visit cosmetics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cosmetic was successfully destroyed"
  end
end
