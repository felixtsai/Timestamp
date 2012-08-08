require 'spec_helper'

describe Teacher do
  it { should belong_to :afterschool_class }

  it { should validate_presence_of :salutation }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  context "uniqueness validation" do
    Teacher.create( :salutation => "Mr.", :first_name => "Patch", :last_name => "Adams", :afterschool_class_id => 1)
    it { should validate_uniqueness_of(:first_name).scoped_to(:last_name) }
  end
end
