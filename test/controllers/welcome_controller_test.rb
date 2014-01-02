require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "route to index page" do
    assert_routing({ path: '/', method: :get }, { controller: 'welcome', action: 'index' })
  end

  test "request of the index action" do
    get :index
    assert_response :success
  end
end
