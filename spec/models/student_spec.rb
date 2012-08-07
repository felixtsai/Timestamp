require 'spec_helper'

describe Student do
  it { should belong_to :afterschool_class }
  it { should belong_to :grade_level }
  it { should have_many :sessions }
end
