require 'date'

class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new( :grade_level_id => params[:assignment][:grade_level_id],
                                  :subject_id     => params[:assignment][:subject_id],
                                  :description    => params[:assignment]['0'][:description],
                                  :due_date       => due_date_concat(params))
    if @assignment.save
      flash[:success] = "Assignments added"
      redirect_to afterschool_classes_path
    else
      flash.now[:error] = "Could not create assignment"
      render :new
    end
  end

  private
    def due_date_concat(params)
      concat_date = params[:assignment]['0']['due_date(1i)'] + "-" + params[:assignment]['0']['due_date(2i)'] + "-" + params[:assignment]['0']['due_date(3i)']
      DateTime.parse(concat_date)
    end
end
