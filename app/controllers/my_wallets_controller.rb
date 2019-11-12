class MyWalletsController < ApplicationController
  before_action :set_my_wallet, only: [:show, :edit, :update, :destroy]

  # GET /my_wallets
  # GET /my_wallets.json
  def index
    @my_wallets = MyWallet.all
  end

  # GET /my_wallets/1
  # GET /my_wallets/1.json
  def show
  end

  # GET /my_wallets/new
  def new
    @my_wallet = MyWallet.new
  end

  # GET /my_wallets/1/edit
  def edit
  end

  # POST /my_wallets
  # POST /my_wallets.json
  def create
    @my_wallet = MyWallet.new(my_wallet_params)

    respond_to do |format|
      if @my_wallet.save
        format.html { redirect_to @my_wallet, notice: 'My wallet was successfully created.' }
        format.json { render :show, status: :created, location: @my_wallet }
      else
        format.html { render :new }
        format.json { render json: @my_wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_wallets/1
  # PATCH/PUT /my_wallets/1.json
  def update
    respond_to do |format|
      if @my_wallet.update(my_wallet_params)
        format.html { redirect_to @my_wallet, notice: 'My wallet was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_wallet }
      else
        format.html { render :edit }
        format.json { render json: @my_wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_wallets/1
  # DELETE /my_wallets/1.json
  def destroy
    @my_wallet.destroy
    respond_to do |format|
      format.html { redirect_to my_wallets_url, notice: 'My wallet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_wallet
      @my_wallet = MyWallet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_wallet_params
      params.require(:my_wallet).permit(:user_id, :balance)
    end
end
