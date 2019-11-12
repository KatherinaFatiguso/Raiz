require "application_system_test_case"

class MyWalletsTest < ApplicationSystemTestCase
  setup do
    @my_wallet = my_wallets(:one)
  end

  test "visiting the index" do
    visit my_wallets_url
    assert_selector "h1", text: "My Wallets"
  end

  test "creating a My wallet" do
    visit my_wallets_url
    click_on "New My Wallet"

    fill_in "Balance", with: @my_wallet.balance
    fill_in "User", with: @my_wallet.user_id
    click_on "Create My wallet"

    assert_text "My wallet was successfully created"
    click_on "Back"
  end

  test "updating a My wallet" do
    visit my_wallets_url
    click_on "Edit", match: :first

    fill_in "Balance", with: @my_wallet.balance
    fill_in "User", with: @my_wallet.user_id
    click_on "Update My wallet"

    assert_text "My wallet was successfully updated"
    click_on "Back"
  end

  test "destroying a My wallet" do
    visit my_wallets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "My wallet was successfully destroyed"
  end
end
