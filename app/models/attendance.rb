class Attendance < ActiveRecord::Base
  attr_accessible :session_id, :status, :student_id
  belongs_to :student
  belongs_to :session
  before_create :log_status

  scope :on_time, where("status = ?", 'On time')
  scope :late, where("status = ?", 'Late')

  def log_status
    if (Time.now - self.session.start_time) > 1.minutes
      self.status = "Late"
    else
      self.status = "On time"
    end
  end
end
