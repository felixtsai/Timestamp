class DayClass < ActiveRecord::Base
  attr_accessible :grade_level_id, :name, :subject_id, :teacher_id
  belongs_to :grade_level
  belongs_to :teacher
  belongs_to :subject
  has_many :students, through: :classes_students
  has_many :assignments
end
