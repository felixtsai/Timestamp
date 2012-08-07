require 'spec_helper'

describe Assignment do

  it { should belong_to :day_class}
  it {should have_many :students}

end
