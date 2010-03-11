require 'test_helper'

class TickersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tickers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticker" do
    assert_difference('Ticker.count') do
      post :create, :ticker => { }
    end

    assert_redirected_to ticker_path(assigns(:ticker))
  end

  test "should show ticker" do
    get :show, :id => tickers(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tickers(:one).id
    assert_response :success
  end

  test "should update ticker" do
    put :update, :id => tickers(:one).id, :ticker => { }
    assert_redirected_to ticker_path(assigns(:ticker))
  end

  test "should destroy ticker" do
    assert_difference('Ticker.count', -1) do
      delete :destroy, :id => tickers(:one).id
    end

    assert_redirected_to tickers_path
  end
end
