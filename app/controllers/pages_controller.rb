class PagesController < ApplicationController
  def home
    @users = User.all
    @transactions = Transaction.all
  end
end