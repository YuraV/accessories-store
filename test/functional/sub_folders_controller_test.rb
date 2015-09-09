require 'test_helper'

class SubFoldersControllerTest < ActionController::TestCase
  setup do
    @sub_folder = sub_folders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_folders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_folder" do
    assert_difference('SubFolder.count') do
      post :create, sub_folder: { published: @sub_folder.published, title: @sub_folder.title }
    end

    assert_redirected_to sub_folder_path(assigns(:sub_folder))
  end

  test "should show sub_folder" do
    get :show, id: @sub_folder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_folder
    assert_response :success
  end

  test "should update sub_folder" do
    put :update, id: @sub_folder, sub_folder: { published: @sub_folder.published, title: @sub_folder.title }
    assert_redirected_to sub_folder_path(assigns(:sub_folder))
  end

  test "should destroy sub_folder" do
    assert_difference('SubFolder.count', -1) do
      delete :destroy, id: @sub_folder
    end

    assert_redirected_to sub_folders_path
  end
end
