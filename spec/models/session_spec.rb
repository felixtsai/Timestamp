require 'spec_helper'

describe Session do
  it {should belong_to :afterschool_class}
  it {should have_many :students }
end