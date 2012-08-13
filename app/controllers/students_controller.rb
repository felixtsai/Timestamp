class StudentsController < ApplicationController

def show
  @student = Student.find(params[:id])

  respond_to do |format|
    format.html
    format.js
  end
end

def update
  @student = Student.find(params[:id])
  @student.update_attributes(params[:student])
  respond_to do |format|
    format.html { redirect_to @student }
    format.js
  end
end


end
