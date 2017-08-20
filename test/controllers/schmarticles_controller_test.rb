require 'test_helper'

class SchmarticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schmarticle = schmarticles(:one)
  end

  test "should get index" do
    get schmarticles_url
    assert_response :success
  end

  test "should get new" do
    get new_schmarticle_url
    assert_response :success
  end

  test "should create schmarticle" do
    assert_difference('Schmarticle.count') do
      post schmarticles_url, params: { schmarticle: { body: @schmarticle.body, title: @schmarticle.title } }
    end

    assert_redirected_to schmarticle_url(Schmarticle.last)
  end

  test "should show schmarticle" do
    get schmarticle_url(@schmarticle)
    assert_response :success
  end

  test "should get edit" do
    get edit_schmarticle_url(@schmarticle)
    assert_response :success
  end

  test "should update schmarticle" do
    patch schmarticle_url(@schmarticle), params: { schmarticle: { body: @schmarticle.body, title: @schmarticle.title } }
    assert_redirected_to schmarticle_url(@schmarticle)
  end

  test "should destroy schmarticle" do
    assert_difference('Schmarticle.count', -1) do
      delete schmarticle_url(@schmarticle)
    end

    assert_redirected_to schmarticles_url
  end
end
