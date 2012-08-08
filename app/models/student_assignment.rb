class StudentAssignment < ActiveRecord::Base
  attr_accessible :assignment_id, :completion_time, :student_id
  belongs_to :student
  belongs_to :assignment
end
