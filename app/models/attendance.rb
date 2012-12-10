class Attendance < ActiveRecord::Base
  attr_accessible :session_id, :status, :student_id
  belongs_to :student
  belongs_to :session
  before_create :log_status

  delegate :date, to: :session

  validates_presence_of :session_id, :student_id
  validate :student_already_in_class_validator, on: :create
  validate :student_class_validator, on: :create

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

  def self.attendance_count
    @start_date = "2012-09-16".to_date
    @days = []
    @start_date.upto(Time.zone.now.to_date) do |day|
      if (day.strftime("%A") != "Saturday") and (day.strftime("%A") != "Sunday")
        @days << day
      end
    end
    @days.count
  end

  def student_already_in_class_validator
    class_attendance = Session.find(self.session_id).attendances
    if class_attendance.find_by_student_id(self.student_id)
      errors[:base] << "Student already checked in for this class."
    end
  end

  def student_class_validator
    student_sessions = Student.find(self.student_id).afterschool_class.sessions
    unless student_sessions.find_by_id(self.session_id)
      errors[:base] << "Student is not in this class."
    end
  end

end
