class AfterschoolClassesController < ApplicationController
  def index
  end

  def new
    @afterschool_class = AfterschoolClass.new
    @afterschool_class.teachers.build
  end

  def create
    @afterschool_class = AfterschoolClass.new(params[:afterschool_class])
    if @afterschool_class.save
      redirect_to afterschool_classes_path, :success => "Class successfully created!"
    else
      render :new
    end
  end
end
