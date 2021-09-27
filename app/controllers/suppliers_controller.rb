class SuppliersController < ApplicationController
  def index
    @suppliers= Supplier.all
  end
  def new
    @supplier= Supplier.new
end

  def show
    @supplier= Supplier.find(params[:id])
     respond_to do |format|
    format.html # render html
    format.vcard { #render vcard }
  end
  end

  def create
    @supplier= Supplier.new(params.require(:supplier).permit(:name))
 if @supplier.save
  redirect_to @supplier
 else
  render 'new_supplier'
   end
  end
end
