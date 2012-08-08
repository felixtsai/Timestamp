class AfterschoolClassesController < ApplicationController
  def index
    @afterschool_classes = AfterschoolClass.find(:all)
    @session = Session.new
  end

  def new
    @afterschool_class = AfterschoolClass.new
    @afterschool_class.teachers.build
    @afterschool_class.students.build
  end

  def create
    @afterschool_class = AfterschoolClass.new(params[:afterschool_class])
    if @afterschool_class.save
      flash[:success] = "Class successfully created!"
      redirect_to @afterschool_class
    else
      render :new
    end
  end

  def show
    @afterschool_class = AfterschoolClass.find(params[:id])
  end
end
