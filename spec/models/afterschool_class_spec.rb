require 'spec_helper'

describe AfterschoolClass do
  it { should have_many :students }
  it { should have_many :teachers }
  it { should have_many :sessions }
  it { should belong_to :grade_level }

  it { should validate_presence_of :grade_level }
  it { should validate_presence_of :teachers }

  it "raises when it is not given a teacher" do
    no_teacher = AfterschoolClass.new( :grade_level_id => 1 )
    no_teacher.should_not be_valid
  end
end
