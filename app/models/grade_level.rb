class GradeLevel < ActiveRecord::Base
  attr_accessible :year
  has_many :students
  has_many :day_classes
  has_many :afterschool_classes

  validates_uniqueness_of :year
end
