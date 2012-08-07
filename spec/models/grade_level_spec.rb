require 'spec_helper'

describe GradeLevel do
  it {should have_many :students}
end
