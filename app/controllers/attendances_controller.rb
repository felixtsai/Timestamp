class AttendancesController < ApplicationController
  def create
    @attendance = Attendance.new(params[:attendance])
    @attendance.save
    @student = @attendance.student
    @session = @attendance.session
    respond_to do |format|
        format.html {redirect_to :back}
        format.js
    end
  end

  def update
    Attendance.find(params[:id]).update_attributes(params[:attendance])
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def destroy
    Attendance.find(params[:id]).destroy
    redirect_to :back
  end
end
