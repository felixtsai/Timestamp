require 'spec_helper'

describe GradeLevel do
  it { should have_many :students }
  it { should have_many :assignments }
  it { should have_many :afterschool_classes}

  it { should validate_uniqueness_of :year }

  it "should ensure inclusion of 6-8th grades" do
    grade = GradeLevel.new(:year => "9th Grade")
    grade.save
    grade.save.should be_false
  end
end
