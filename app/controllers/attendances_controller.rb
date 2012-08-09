class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new(params[:attendance])
    @attendance.save
    redirect_to :back
  end

  def update
    Attendance.find(params[:id]).update_attributes(params[:attendance])
    redirect_to :back
  end

  def destroy
    Attendance.find(params[:id]).destroy
    redirect_to :back
  end
end
