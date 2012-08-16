class Session < ActiveRecord::Base
  attr_accessible :afterschool_class_id, :date, :start_time
  belongs_to :afterschool_class
  has_many :attendances, :dependent => :destroy
  has_many :students, through: :attendances
  has_many :assignments, :through => :afterschool_class
  has_many :student_assignments, :through => :students

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
    "#{((attendances.count.to_f) / (afterschool_class.students.count.to_f)*100).to_i}%"
  end

  def overall_assignment_completion_percentage
    total_assignments = student_assignments.by_current.count
    completed_assignments = student_assignments.by_current.completed.count
    total_assignments != 0 ? "#{(completed_assignments.to_f / total_assignments.to_f*100).to_i}%" : "N/A"
  end

  def math_assignment_completion_percentage
    total_assignments = assignments.for_students.math.count
    completed_assignments = assignments.for_students.math.completed.count
    total_assignments != 0 ? "#{(completed_assignments.to_f / total_assignments.to_f*100).to_i}%" : "N/A"
  end

  def ela_assignment_completion_percentage
    total_assignments = assignments.for_students.ela.count
    completed_assignments = assignments.for_students.ela.completed.count
     total_assignments != 0 ? "#{(completed_assignments.to_f / total_assignments.to_f*100).to_i}%" : "N/A"
  end

  def social_studies_assignment_completion_percentage
    total_assignments = assignments.for_students.social_studies.count
    completed_assignments = assignments.for_students.social_studies.completed.count
    total_assignments != 0 ? "#{(completed_assignments.to_f / total_assignments.to_f*100).to_i}%" : "N/A"
  end

  def science_assignment_completion_percentage
    total_assignments = assignments.for_students.science.count
    completed_assignments = assignments.for_students.science.completed.count
    total_assignments != 0 ? "#{(completed_assignments.to_f / total_assignments.to_f*100).to_i}%" : "N/A"
  end

  def extra_credit_assignment_completion_percentage
    total_assignments = assignments.for_students.extra_credit.count
    completed_assignments = assignments.for_students.extra_credit.completed.count
    total_assignments != 0 ? "#{(completed_assignments.to_f / total_assignments.to_f*100).to_i}%" : "N/A"
  end

end
