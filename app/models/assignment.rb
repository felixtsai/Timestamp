class Assignment < ActiveRecord::Base
  attr_accessible :completion_percentage, :day_class_id, :description, :due_date

  has_many :students, through: :student_assignments
  belongs_to :day_class

end
