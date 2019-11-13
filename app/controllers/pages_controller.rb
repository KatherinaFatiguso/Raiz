class PagesController < ApplicationController
  def home
    @users = User.all
    @transactions = Transaction.all
  end

  def find_user
    if params[:sender]
      @sender = User.find(params[:sender])
      puts @sender.id
    end
    if params[:recipient]
      @recipient = User.find(params[:recipient])
      puts @recipient.id
    end
    if params[:amount]
      @amount = params[:amount]
      puts params[:amount]
    end
    redirect_to root_path
  end

  def create_transaction(sender, recipient, amount)
    puts sender, recipient, amount
  end
end