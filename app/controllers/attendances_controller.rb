class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new(params[:attendance])
    @attendance.save
    redirect_to :back
  end

  def update
  end

  def destroy
  end
end
