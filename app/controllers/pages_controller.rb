class PagesController < ApplicationController
  def home
    @users = User.all
    @transactions = Transaction.all
  end

  def find_users
    if params[:sender].present? && params[:recipient].present? && params[:amount].present?
      @sender = User.find(params[:sender])
      puts @sender.id
      @recipient = User.find(params[:recipient])
      puts @recipient.id
      @amount = params[:amount]
      puts params[:amount]
      create_transaction(@sender, @recipient, @amount)
    else
      puts 'Please complete all fields'
      false
    end
    redirect_to root_path
  end

  def create_transaction(sender, recipient, amount)
    puts '==='
    puts sender.id, recipient.id, amount
    if check_amount_against_balance(sender, amount)
      puts 'enough balance'
      # Sender
      withdraw(sender, amount)
      create_debit_transaction(sender, amount)

      # Recipient
      deposit(recipient, amount)
      create_credit_transaction(recipient, amount)
    else
      puts 'not enough balance'
    end
    true
  end

  def check_amount_against_balance(user, amount)
    puts 'checking balance'
    return user.my_wallet.balance >= amount.to_f
  end

  # Obtain row locks on ActiveRecord objects
  def deposit(user, amount)
    user.with_lock do
      user.my_wallet.balance += amount.to_f
      user.my_wallet.save!
    end
  end

  def withdraw(user, amount)
    user.with_lock do
      user.my_wallet.balance -= amount.to_f
      user.my_wallet.save!
    end
  end

  def create_debit_transaction(user, amount)
    user.with_lock do
      user.transactions << Transaction.create(name: 'debit', source_wallet: user.my_wallet.id, amount: amount.to_f)
    end
  end

  def create_credit_transaction(user, amount)
    user.with_lock do
      user.transactions << Transaction.create(name: 'credit', target_wallet: user.my_wallet.id, amount: amount.to_f)
    end
  end
end