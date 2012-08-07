require 'spec_helper'

describe ClassesStudents do
  it {should belong_to :student}
  it {should belong_to :day_class}
end
