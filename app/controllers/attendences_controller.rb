class AttendencesController < ApplicationController

  def create
    @attendence = current_user.attendences.build(attendence_params)
    @attendence.save
    redirect_to @attendence.attended_event
  end

  def destroy
    @attendence = current_user.attendences.find_by(attended_event_id: params[:attendence][:attended_event_id])
    @event = @attendence.attended_event
    @attendence.destroy
    redirect_to @event
  end

  private
    def attendence_params
      params.require(:attendence).permit(:attended_event_id)
    end
end
