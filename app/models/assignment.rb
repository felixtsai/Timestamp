class Assignment < ActiveRecord::Base
  attr_accessible :completion_percentage, :description, :due_date, :subject_id, :grade_level_id
  has_many :students, through: :student_assignments
  has_many :student_assignments
  belongs_to :subject
  belongs_to :grade_level

  after_create :assign_student_assignments

  def assign_student_assignments
    grade_level.students.each do |student|
      StudentAssignment.create(:student_id => student.id, :assignment_id => self.id)
    end
  end
end
