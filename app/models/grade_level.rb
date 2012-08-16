class GradeLevel < ActiveRecord::Base
  attr_accessible :year
  has_many :afterschool_classes
  has_many :students, :through => :afterschool_classes
  has_many :sessions, :through => :afterschool_classes
  has_many :assignments

  validates_uniqueness_of :year
  validates_inclusion_of :year, :in => ["6th Grade", "7th Grade", "8th Grade"]
  #Do not ever change the drop down menu for the grade because there is no vaidation of inclusion.

  def overall_attendance_percent
    if total_student_count == 0
      "N/A"
    else
      "#{((total_attendances.to_f) / (total_student_count)*100).to_i}%"
    end
  end

  def total_student_count
    count = 0
    afterschool_classes.each do |afterschool_class|
      count += afterschool_class.students.length
    end
    count
  end

  def total_attendances
    count = 0
    current_sessions.each do |session|
      count += session.attendances.length
    end
    count
  end

  def on_time_count
    count = 0
    current_sessions.each do |session|
      count += session.on_time_count
    end
    count
  end

  def absent_count
    count = 0
    current_sessions.each do |session|
      count += session.absent_count
    end
    count
  end

  def late_count
    count = 0
    current_sessions.each do |session|
      count += session.late_count
    end
    count
  end

  def current_sessions
    sessions.find_all_by_date(Date.today)
  end

  def overall_assignment_completion_percentage
    total_assignments = assignments.by_current.for_students.count
    completed_assignments = assignments.by_current.for_students.completed.count
    total_assignments != 0 ? "#{(completed_assignments.to_f / total_assignments.to_f*100).to_i}%" : "N/A"
  end

  def math_assignment_completion_percentage
    total_assignments = assignments.by_current.for_students.math.count
    completed_assignments = assignments.by_current.for_students.math.completed.count
    total_assignments != 0 ? "#{(completed_assignments.to_f / total_assignments.to_f*100).to_i}%" : "N/A"
  end

  def ela_assignment_completion_percentage
    total_assignments = assignments.by_current.for_students.ela.count
    completed_assignments = assignments.by_current.for_students.ela.completed.count
     total_assignments != 0 ? "#{(completed_assignments.to_f / total_assignments.to_f*100).to_i}%" : "N/A"
  end

  def social_studies_assignment_completion_percentage
    total_assignments = assignments.by_current.for_students.social_studies.count
    completed_assignments = assignments.by_current.for_students.social_studies.completed.count
    total_assignments != 0 ? "#{(completed_assignments.to_f / total_assignments.to_f*100).to_i}%" : "N/A"
  end

  def science_assignment_completion_percentage
    total_assignments = assignments.by_current.for_students.science.count
    completed_assignments = assignments.by_current.for_students.science.completed.count
    total_assignments != 0 ? "#{(completed_assignments.to_f / total_assignments.to_f*100).to_i}%" : "N/A"
  end

  def extra_credit_assignment_completion_percentage
    total_assignments = assignments.by_current.for_students.extra_credit.count
    completed_assignments = assignments.by_current.for_students.extra_credit.completed.count
    total_assignments != 0 ? "#{(completed_assignments.to_f / total_assignments.to_f*100).to_i}%" : "N/A"
  end

end
