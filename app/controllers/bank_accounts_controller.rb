class BankAccountsController < ApplicationController
  before_action :set_bank_account, only: %i[ show update destroy add_money]

  # GET /bank_accounts
  # GET /bank_accounts.json
  def index
    @bank_accounts = BankAccount.all
  end

  # GET /bank_accounts/1
  # GET /bank_accounts/1.json
  def show
  end

  # POST /bank_accounts
  # POST /bank_accounts.json
  def create
    @bank_account = BankAccount.new(bank_account_params)

    if @bank_account.save
      render :show, status: :created, location: @bank_account
    else
      render json: @bank_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bank_accounts/1
  # PATCH/PUT /bank_accounts/1.json
  def update
    if @bank_account.update(bank_account_params)
      render :show, status: :ok, location: @bank_account
    else
      render json: @bank_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bank_accounts/1
  # DELETE /bank_accounts/1.json
  def destroy
    @bank_account.destroy
  end

  def add_money
    @bank_account_transaction = @bank_account.add_money(amount: bank_account_add_money_params[:amount], execution_date: bank_account_add_money_params[:execution_date], remarks: bank_account_add_money_params[:remarks])

    if @bank_account_transaction.errors.blank?
      render :bank_account_transaction, status: :created
    else
      render json: @bank_account_transaction.errors, status: :unprocessable_entity
    end
  end

  
  private
  # Use callbacks to share common setup or constraints between actions.
    def set_bank_account
      @bank_account = BankAccount.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def bank_account_params
      params.fetch(:bank_account, {})
      params.require(:bank_account).permit(:user_id,:account_number,:ifsc_code,:bank_name,:balance)
    end

    def bank_account_add_money_params
      params.permit(:amount, :execution_date, :remarks)
    end
   
end
