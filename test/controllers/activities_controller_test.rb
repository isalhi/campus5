require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  setup do
    @activity = activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity" do
    assert_difference('Activity.count') do
      post :create, activity: { cathegory: @activity.cathegory, date: @activity.date, description: @activity.description, duration: @activity.duration, id_activity: @activity.id_activity, id_creator: @activity.id_creator, id_location: @activity.id_location, name: @activity.name, privacy: @activity.privacy }
    end

    assert_redirected_to activity_path(assigns(:activity))
  end

  test "should show activity" do
    get :show, id: @activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity
    assert_response :success
  end

  test "should update activity" do
    patch :update, id: @activity, activity: { cathegory: @activity.cathegory, date: @activity.date, description: @activity.description, duration: @activity.duration, id_activity: @activity.id_activity, id_creator: @activity.id_creator, id_location: @activity.id_location, name: @activity.name, privacy: @activity.privacy }
    assert_redirected_to activity_path(assigns(:activity))
  end

  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete :destroy, id: @activity
    end

    assert_redirected_to activities_path
  end
end
