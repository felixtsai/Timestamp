require 'spec_helper'

describe DayClass do
  it { should have_many :students}
  it { should belong_to :teacher}
  it { should belong_to :grade_level }
  it { should belong_to :subject}
  it { should have_many :assignments}
end