class GradeLevel < ActiveRecord::Base
  attr_accessible :year
  has_many :students
  has_many :afterschool_classes
  has_many :assignments

  validates_uniqueness_of :year
  validates_inclusion_of :year, :in => ["6th Grade", "7th Grade", "8th Grade"]
  #Do not ever change the drop down menu for the grade because there is no vaidation of inclusion.
end
