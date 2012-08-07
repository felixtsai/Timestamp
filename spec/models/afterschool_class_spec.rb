require 'spec_helper'

describe AfterschoolClass do
  it { should have_many :students }
  it { should have_many :teachers }
  it { should have_many :sessions }
  it { should belong_to :grade_level }

  it { should validate_presence_of :grade_level }
  it { should validate_presence_of :teachers }
  # it { should validate_presence_of :teachers.first_name }
  # it { should validate_presence_of :teachers.last_name }
end
