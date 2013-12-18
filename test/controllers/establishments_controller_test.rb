require 'test_helper'

class EstablishmentsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "route to index page" do
    assert_routing({ path: 'establishments', method: :get }, { controller: 'establishments', action: 'index' })
  end

  test "request of the index action" do
    get :index
    assert_response :success
  end
end
