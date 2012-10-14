class StudentAssignment < ActiveRecord::Base

  attr_accessible :assignment_id, :completion_time, :student_id, :status
  belongs_to :student
  belongs_to :assignment
  delegate :due_date, to: :assignment
  delegate :subject_name, to: :assignment

  scope :completed, where("completion_time IS NOT NULL")
  scope :by_current, joins(:assignment).where('assignments.due_date > ?', Time.zone.now.to_date)

  #Write validation so you cannot create two student-assignments for the same assigment for
  # the same student.

end
