require 'date'

class AssignmentsController < ApplicationController

  def index
    @assignments = Assignment.all
  end

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
      redirect_to assignments_path
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    @assignment.update_attributes(params[:assignment])
    flash[:success] = "Assignment Updated"
    redirect_to assignments_path
  end

  def destroy
    @assignment = Assignment.find(params[:id]).destroy
    flash[:success] = "Assignment Deleted"
    redirect_to :back
  end
end
