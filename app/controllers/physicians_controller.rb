class PhysiciansController < ApplicationController
  def index
    @physician= Physician.all
end

def show
      @physician= Physician.find(params[:id])
  end
  def new
@physician= Physician.new
  end
  def create
    @physician= Physician.create(params.require(:physician).permit(:name))
    if @physician.save
      redirect_to physician_path(@physician)
  else 
    render "new_physician"
  end
  end
end
