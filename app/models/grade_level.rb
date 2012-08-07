class GradeLevel < ActiveRecord::Base
  attr_accessible :year
  has_many :students
end
