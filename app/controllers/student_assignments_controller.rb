class StudentAssignmentsController < ApplicationController
  def update
    @student_assignment = StudentAssignment.find(params[:id])
    if @student_assignment.update_attributes(:completion_time => params[:completion_time])
      respond_to do |format|
          format.html {redirect_to :back}
          format.js
      end
    end
  end
end
