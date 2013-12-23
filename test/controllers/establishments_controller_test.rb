require 'test_helper'

class EstablishmentsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "route to index page" do
    assert_routing({ path: 'establishments', method: :get }, { controller: 'establishments', action: 'index' })
  end

  test "request of the index action listing of establishments on index page" do
    get :index
    assert_response :success
    assert_not_nil assigns(:establishments)

    assert_select "ul"
    assert_select "li"
  end

  test "route to new page" do
    assert_routing({ path: 'establishments/new', method: :get }, { controller: 'establishments', action: 'new' })
  end

  test "request of the new action" do
    get :new
    assert_response :success
  end
end
