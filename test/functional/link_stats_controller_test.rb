require 'test_helper'

class LinkStatsControllerTest < ActionController::TestCase
  setup do
    @link_stat = link_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:link_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create link_stat" do
    assert_difference('LinkStat.count') do
      post :create, link_stat: { comment_count: @link_stat.comment_count, like_count: @link_stat.like_count, link_is: @link_stat.link_is, share_count: @link_stat.share_count }
    end

    assert_redirected_to link_stat_path(assigns(:link_stat))
  end

  test "should show link_stat" do
    get :show, id: @link_stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @link_stat
    assert_response :success
  end

  test "should update link_stat" do
    put :update, id: @link_stat, link_stat: { comment_count: @link_stat.comment_count, like_count: @link_stat.like_count, link_is: @link_stat.link_is, share_count: @link_stat.share_count }
    assert_redirected_to link_stat_path(assigns(:link_stat))
  end

  test "should destroy link_stat" do
    assert_difference('LinkStat.count', -1) do
      delete :destroy, id: @link_stat
    end

    assert_redirected_to link_stats_path
  end
end
