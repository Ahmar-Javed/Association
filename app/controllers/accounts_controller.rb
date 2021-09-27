class AccountsController < ApplicationController
  def index
    @accounts =  Account.all
  end
  def new
    @supplier= Supplier.find(params[:supplier_id])
    @account=@supplier.build_account

  end
  def show
    @supplier= Supplier.find(params[:supplier_id])
    @account= Account.find(params[:id])
end
def create
  @supplier= Supplier.find(params[:supplier_id])
  @account=@supplier.build_account(params.require(:account).permit(:account_number))
  if @account.save
    redirect_to supplier_account_path(@supplier, @account)
  else
    render 'new_supplier_account'
  end
end
def destroy
    @account=Account.find(params[:id])
    @account.destroy
    redirect_to suppliers_path
  end
end
