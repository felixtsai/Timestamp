require 'spec_helper'

describe Student do
  it { should have_many :sessions }
  it { should have_many :assignments }
  it { should belong_to :afterschool_class }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :afterschool_class }
end
