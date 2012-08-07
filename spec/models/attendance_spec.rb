require 'spec_helper'

describe Attendance do
  it { should belong_to :session}
  it { should belong_to :student}
end