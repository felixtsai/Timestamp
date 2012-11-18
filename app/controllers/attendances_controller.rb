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

  def show
    @start_date = "2012-09-01".to_date
    @student = Student.find(params[:id])
    @attendances = @student.attendances
  end


  def update
    Attendance.find(params[:id]).update_attributes(params[:attendance])
    @attendance = Attendance.find(params[:id])
    @student = @attendance.student
    @session = @attendance.session
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @student = @attendance.student
    @session = @attendance.session
    Attendance.find(params[:id]).destroy
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end
end
