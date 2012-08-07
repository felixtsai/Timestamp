require 'spec_helper'

describe AfterschoolClass do
  it { should have_many :students }
  it { should have_many :teachers }
  it { should have_many :sessions }
  it { should belong_to :grade_level }
end
