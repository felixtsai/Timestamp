require 'spec_helper'

describe GradeLevel do
  it {should have_many :students}
  it {should have_many :day_classes }
  it {should have_many :afterschool_classes}
end
