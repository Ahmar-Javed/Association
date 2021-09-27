class PatientsController < ApplicationController
  def index
    @patients= Patient.all
  end
  def show
    @patient= Patient.find(params[:id]) 
      end
 def new
  @patient= Patient.new
 end
 def create
  @patient= Patient.create(params.require(:patient).permit(:name))
  if @patient.save
    redirect_to @patient
  else 
    render "new_patient"
 end
end
end
