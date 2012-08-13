class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @student = Student.find(params[:id]).destroy
    flash[:success] = "#{@student.first_name} #{@student.last_name} has been removed from class"
    redirect_to :back
  end

  def update
    @student = Student.find(params[:id])
    @student.update_attributes(params[:student])
    redirect_to :back
  end
end

