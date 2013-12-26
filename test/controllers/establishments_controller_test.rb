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

  test "request of the new action and view" do
    get :new
    assert_response :success
    assert_not_nil assigns(:establishment)

    assert_select "form input" do
      assert_select "[name=?]", 'establishment[name]'
      assert_select "[name=?]", 'establishment[address]'
      assert_select "[name=?]", 'establishment[zipcode]'
      assert_select "[name=?]", 'establishment[city]'
      assert_select "[name=?]", 'establishment[state]'
      assert_select "[type=?]", 'submit'
    end

    assert_select "form textarea" do
      assert_select "[name=?]", 'establishment[description]'
    end
  end

  test "route for create" do
    assert_routing({ path: 'establishments', method: :post }, { controller: 'establishments', action: 'create' })
  end

  test "saving the new establishment submited" do
    assert_difference('Establishment.count') do
      post :create, establishment: {
                            name: 'Mc Donalds',
                            description: 'Restaurante fast food americano',
                            address: 'Av. Dr. Timoteo Penteado',
                            zipcode: '07071000',
                            city: 'Guarulhos',
                            state: 'São Paulo'
                          }
    end

    assert_redirected_to "index"
  end
end
