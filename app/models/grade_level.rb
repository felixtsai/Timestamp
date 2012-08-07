class GradeLevel < ActiveRecord::Base
  attr_accessible :year
  has_many :students
  has_many :afterschool_classes
end
