require 'date'

class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
  end

  def create
    @assignments = Assignment.build_many(params[:assignment])
    @errors = []
    if @assignments.map(&:valid?).include? false
      @assignments.each do |assignment|
        assignment.valid? == false ? @errors += assignment.errors.full_messages : assignment
      end
      @errors.uniq!
      render :new
    else
      Assignment.save_all(@assignments)
      flash[:success] = "Assignments added"
      redirect_to afterschool_classes_path
    end
  end
end
