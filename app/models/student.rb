class Student < ActiveRecord::Base
  attr_accessible :afterschool_class_id, :first_name, :grade_level_id, :last_name

  belongs_to :grade_level
  belongs_to :afterschool_class
  has_many :assignments, through: :student_assignments
  has_many :sessions, through: :attendances
end
