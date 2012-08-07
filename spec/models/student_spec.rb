require 'spec_helper'

describe Student do
  it { should have_many :sessions }
  it { should have_many :assignments}
  it { should belong_to :afterschool_class }
  it { should belong_to :grade_level }
end
