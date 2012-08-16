class SessionsController < ApplicationController
  def create
    @session = Session.create(afterschool_class_id: params[:afterschool_class_id], date: Time.now.to_date, start_time: Time.now )
    redirect_to afterschool_class_session_path(@session.afterschool_class_id, @session)
  end

  def show
    @session = Session.find(params[:id])
    @afterschool_class = @session.afterschool_class
    @teacher = @afterschool_class.teachers.first

    respond_to do |format|
      format.html
      format.js
      # format.csv { render text: @session}
    end
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
    @sessions = Session.today
    respond_to do |format|
      format.csv {send_data @sessions.to_csv }
      format.xlsx
    end
  end
end
