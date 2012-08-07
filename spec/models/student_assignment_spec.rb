require 'spec_helper'

describe StudentAssignment do
  it { should belong_to :assignment }
  it { should belong_to :student }
end