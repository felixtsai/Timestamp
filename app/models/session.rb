class Session < ActiveRecord::Base
  attr_accessible :afterschool_class_id, :date, :start_time
  belongs_to :afterschool_class
  has_many :attendances, :dependent => :destroy
  has_many :students, through: :attendances
  has_many :assignments, :through => :afterschool_class
  has_many :roster_students, through: :afterschool_class, source: :students
  has_many :student_assignments, through: :roster_students
  has_one :teacher, :through => :afterschool_class

  scope :today, where("date = ?", Time.zone.now.to_date)

  # validates_with UniqueClassValidator
  validate :unique_class_validator

  def session_student_count
    #students in attendance (either on time or late)
    students.count
  end

  def absent_count
    afterschool_class.students.count - attendances.count
  end

  def on_time_count
    attendances.on_time.count
  end

  def late_count
    attendances.late.count
  end

  def overall_attendance_percent
    afterschool_class.students.count != 0 ? "#{((attendances.count.to_f) / (afterschool_class.students.count.to_f)*100).to_i}%" :"N/A"
  end

  def overall_assignment_completion_percentage
    student_assignments.count != 0 ? "#{(student_assignments.completed.count.to_f / student_assignments.count.to_f * 100).to_i}%" : "N/A"
  end

  def subject_completion_percentage(subject)
    total = student_assignments.select{|sa| sa.subject_name == subject}.count.to_f
    completed = student_assignments.select{|sa| sa.subject_name == subject && sa.completion_time != nil}.count.to_f
    total != 0 ? "#{(completed/total * 100).to_i}%" : "N/A"
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << [ "Session","Overall Assignment %", "Math", "ELA", "SS", "Science","EC", "Attendance %", "On Time #", "Late #", "Absent #"]
      all.each do |session|
        csv << [
          session.afterschool_class.grade_level.year + " " + session.afterschool_class.teachers.first.first_name + " " + session.afterschool_class.teachers.first.last_name,
          session.overall_assignment_completion_percentage,
          session.subject_completion_percentage("Math"),
          session.subject_completion_percentage("English Language Arts (ELA)"),
          session.subject_completion_percentage("Social Studies"),
          session.subject_completion_percentage("Science"),
          session.subject_completion_percentage("Extra Credit"),
          session.overall_attendance_percent,
          session.on_time_count,
          session.late_count,
          session.absent_count
        ]
      end
    end
  end

  private

  def unique_class_validator
    if Session.today.collect {|session| session.afterschool_class_id}.include? afterschool_class_id
      errors[:base] << "This class is already in session"
    end
  end
end
