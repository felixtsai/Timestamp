class Attendance < ActiveRecord::Base
  attr_accessible :session_id, :status, :student_id
  belongs_to :student
  belongs_to :session
  before_create :log_status

  delegate :date, to: :session

  scope :on_time, where("status = ?", 'On time')
  scope :late, where("status = ?", 'Late')
  scope :by_date, order("created_at desc")

  def log_status
    if (Time.zone.now - self.session.start_time) > 5.minutes
      self.status = "Late"
    else
      self.status = "On time"
    end
  end
end
