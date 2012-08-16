class GradeLevelsController < ApplicationController
  def show
    @grade_level = GradeLevel.find(params[:id])
    respond_to do |format|
        format.html {redirect_to :back}
        format.js
    end
  end
end