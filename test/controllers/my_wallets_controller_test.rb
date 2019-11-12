require 'test_helper'

class MyWalletsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_wallet = my_wallets(:one)
  end

  test "should get index" do
    get my_wallets_url
    assert_response :success
  end

  test "should get new" do
    get new_my_wallet_url
    assert_response :success
  end

  test "should create my_wallet" do
    assert_difference('MyWallet.count') do
      post my_wallets_url, params: { my_wallet: { balance: @my_wallet.balance, user_id: @my_wallet.user_id } }
    end

    assert_redirected_to my_wallet_url(MyWallet.last)
  end

  test "should show my_wallet" do
    get my_wallet_url(@my_wallet)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_wallet_url(@my_wallet)
    assert_response :success
  end

  test "should update my_wallet" do
    patch my_wallet_url(@my_wallet), params: { my_wallet: { balance: @my_wallet.balance, user_id: @my_wallet.user_id } }
    assert_redirected_to my_wallet_url(@my_wallet)
  end

  test "should destroy my_wallet" do
    assert_difference('MyWallet.count', -1) do
      delete my_wallet_url(@my_wallet)
    end

    assert_redirected_to my_wallets_url
  end
end
