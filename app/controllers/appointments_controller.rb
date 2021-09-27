class AppointmentsController < ApplicationController
  def index
    if (params[:patient_id])
      @patient= Patient.find(params[:patient_id])
      @appointments=  @patient.appointments.all
    else
      @physician= Physician.find(params[:physician_id])
      @appointments= @physician.appointments.all
    end
  end
  def new
    if (params[:patient_id])
       @patient= Patient.find(params[:patient_id])
       @physicians= Physician.all
       @appointment= @patient.appointments.build
     else
      @physician= Physician.find(params[:physician_id])
      @patients= Patient.all
       @appointment= @physician.appointments.build
     end

  end
def create
  if (params[:patient_id])
     @patient= Patient.find(params[:patient_id])
     @appointment= @patient.appointments.build(params.require(:appointment).permit(:appointment_date, :physician_id))
     if @appointment.save
      redirect_to patient_appointment_path(@patient, @appointment)
    else
      render "new_patient_appointment"
    end
else
  @physician= Physician.find(params[:physician_id])
     @appointment= @physician.appointments.build(params.require(:appointment).permit(:appointment_date, :patient_id))
     if @appointment.save
      redirect_to physician_appointment_path(@physician, @appointment)
    else
      render "new_physician_appointment"
    end
end

end
def show
    @appointment=Appointment.find(params[:id])
  end
end
