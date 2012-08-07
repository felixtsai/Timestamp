require 'spec_helper'

describe Assignment do
  it { should have_many :students }
  it { should belong_to :subject }
  it { should belong_to :grade_level }
end
