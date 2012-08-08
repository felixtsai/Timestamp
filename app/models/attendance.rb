class Attendance < ActiveRecord::Base
  attr_accessible :session_id, :status, :student_id
  belongs_to :student
  belongs_to :session
  before_create :log_status

  def log_status
    if (Time.now - self.session.start_time) > 10.seconds
      self.status = "Late"
    else
      self.status = "On Time"
    end
  end
end
