require 'spec_helper'

describe Assignment do
  it { should have_many :students }
  it { should have_many :student_assignments }
  it { should belong_to :subject }
  it { should belong_to :grade_level }

  it {should validate_presence_of :grade_level }
  it {should validate_presence_of :subject }
  it {should validate_presence_of :description }
  it {should validate_presence_of :due_date }
end
