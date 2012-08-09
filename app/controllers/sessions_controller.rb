class SessionsController < ApplicationController
  def create
    @session = Session.create(afterschool_class_id: params[:afterschool_class_id], date: Time.now.to_date, start_time: Time.now )
    redirect_to afterschool_class_session_path(@session.afterschool_class_id, @session)
  end

  def show
    @session = Session.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    Session.find(params[:id]).destroy
    flash[:success] = "Session has been ended"
    redirect_to afterschool_classes_path
  end

  def index
  end
end
