require 'test_helper'

class CosmeticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cosmetic = cosmetics(:one)
  end

  test "should get index" do
    get cosmetics_url
    assert_response :success
  end

  test "should get new" do
    get new_cosmetic_url
    assert_response :success
  end

  test "should create cosmetic" do
    assert_difference('Cosmetic.count') do
      post cosmetics_url, params: { cosmetic: { carousel: @cosmetic.carousel, category: @cosmetic.category, exp_date: @cosmetic.exp_date, memo: @cosmetic.memo, title: @cosmetic.title, user_id: @cosmetic.user_id } }
    end

    assert_redirected_to cosmetic_url(Cosmetic.last)
  end

  test "should show cosmetic" do
    get cosmetic_url(@cosmetic)
    assert_response :success
  end

  test "should get edit" do
    get edit_cosmetic_url(@cosmetic)
    assert_response :success
  end

  test "should update cosmetic" do
    patch cosmetic_url(@cosmetic), params: { cosmetic: { carousel: @cosmetic.carousel, category: @cosmetic.category, exp_date: @cosmetic.exp_date, memo: @cosmetic.memo, title: @cosmetic.title, user_id: @cosmetic.user_id } }
    assert_redirected_to cosmetic_url(@cosmetic)
  end

  test "should destroy cosmetic" do
    assert_difference('Cosmetic.count', -1) do
      delete cosmetic_url(@cosmetic)
    end

    assert_redirected_to cosmetics_url
  end
end
