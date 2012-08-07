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
      flash[:success] = "Class successfully created!"
      redirect_to @afterschool_class
    else
      flash.now[:error] = "Cannot create class without teacher or grade level!"
      render :new
    end
  end

  def show
    @afterschool_class = AfterschoolClass.find(params[:id])
  end
end
