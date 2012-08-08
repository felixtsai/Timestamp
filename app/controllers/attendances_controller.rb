class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new(params[:attendance])
    if (Time.now - @attendance.session.start_time) > 20.minutes
      @attendance.status = "Late"
    else
      @attendance.status = "On Time"
    end
    @attendance.save
    redirect_to :back
  end

  def update
  end

  def destroy
  end
end
