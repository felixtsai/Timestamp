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

#Write custom validation to make sure only one session of a class can be created per day.""
  # validates(:date, :uniqueness => true, :message => "only one class can be created per day")

  def session_student_count
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
      csv << column_names
      all.each do |assignment|
        csv << assignment.attributes.values_at(*column_names)
      end
    end
  end
end
