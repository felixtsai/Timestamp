class AfterschoolClassesController < ApplicationController
  def index
  end

  def new
    @afterschool_class = AfterschoolClass.new
    @afterschool_class.teacher
  end

  def create
    @afterschool_class = AfterschoolClass.new(params[:afterschool_class])
    if @afterschool_class.save
      redirect_to afterschool_classes_path
    else
      render :new
    end
  end
end
