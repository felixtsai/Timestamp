class StudentReportsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @s_a = @student.all_assignments_by_due_date
  end
end
