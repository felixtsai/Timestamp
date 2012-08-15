class Session < ActiveRecord::Base
  attr_accessible :afterschool_class_id, :date, :start_time
  belongs_to :afterschool_class
  has_many :attendances, :dependent => :destroy
  has_many :students, through: :attendances
  has_many :assignments, :through => :afterschool_class


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
    "#{(attendances.count.to_f) / (afterschool_class.students.count.to_f)*100}%"
  end

  def overall_assignment_completion_percentage
    total_assignments = assignments.for_students.count
    completed_assignments = assignments.for_students.completed.count
    total_assignments != 0 ? completed_assignments.to_f / total_assignments.to_f : "No Assignments"
    # total_done_assignments = 0
    # students.each do |student|
    #   total_done_assignments += (student.student_assignments.count - student.total_outstanding_assignments_count)
    # end
    # "#{(total_done_assignments.to_f)/(afterschool_class.grade_level.assignments.count * students.count)*100.00}%"
  end

  def math_assignment_completion_percentage
    total_assignments = assignments.for_students.math.count
    completed_assignments = assignments.for_students.math.completed.count
    total_assignments != 0 ? completed_assignments.to_f / total_assignments.to_f : "No Assignments"
  end

  def ela_assignment_completion_percentage
    total_assignments = assignments.for_students.ela.count
    completed_assignments = assignments.for_students.ela.completed.count
     total_assignments != 0 ? completed_assignments.to_f / total_assignments.to_f : "No Assignments"
  end

  def social_studies_assignment_completion_percentage
    total_assignments = assignments.for_students.social_studies.count
    completed_assignments = assignments.for_students.social_studies.completed.count
    total_assignments != 0 ? completed_assignments.to_f / total_assignments.to_f : "No Assignments"
  end

  def science_assignment_completion_percentage
    total_assignments = assignments.for_students.science.count
    completed_assignments = assignments.for_students.science.completed.count
    total_assignments != 0 ? completed_assignments.to_f / total_assignments.to_f : "No Assignments"
  end

  def extra_credit_assignment_completion_percentage
    total_assignments = assignments.for_students.extra_credit.count
    completed_assignments = assignments.for_students.extra_credit.completed.count
    total_assignments != 0 ? completed_assignments.to_f / total_assignments.to_f : "No Assignments"
  end

end
