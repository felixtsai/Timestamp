class AfterschoolClass < ActiveRecord::Base
  attr_accessible :grade_level_id, :teachers_attributes

  has_many :students
  has_many :teachers
  belongs_to :grade_level

  accepts_nested_attributes_for :teachers
end
