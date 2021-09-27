class AccountHistoriesController < ApplicationController
  def index
    @account_history= Account_histories.all
  end
  def new
@supplier= Supplier.find(params[:supplier_id])
@account= @supplier.account
@account_history=@supplier.account.build_account_history
  end

 def create
 #@supplier= Supplier.find(params[:supplier_id])
 @account=Account.find(params[:account_id])
  @account_history= @account.build_account_history(params.require(:account).permit(:account_number))
  if @account_history.save
    redirect_to supplier_account_account_histories_path(@supplier,@account)
  else
    render "new_supplier_account_account_histories"

 end
end
