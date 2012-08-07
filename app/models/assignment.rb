class Assignment < ActiveRecord::Base
  attr_accessible :completion_percentage, :day_class_id, :description, :due_date, :subject_id

  has_many :students, through: :student_assignments
  belongs_to :subject
  belongs_to :grade_level
end
