require 'spec_helper'

describe Session do
  it {should belong_to :afterschool_class}
  it {should have_many :students }
  it {should have_many :attendances}
  it {should have_many :assignments}
  it {should have_many :student_assignments}
  it {should have_one :teacher}

  it "should have a method today that shows all the sessions for the day." do
  class_1 = Session.create(afterschool_class_id: 1, date: Time.zone.now.to_date)
  class_2 = Session.create(afterschool_class_id: 2, date: Time.zone.now.to_date)
  class_3 = Session.create(afterschool_class_id: 3, date: Date.yesterday)
  Session.today.should include class_1
  Session.today.should include class_2
  Session.today.should_not include class_3
	end
end

describe "UniqueClassValidator" do
	it "should prevent two sessions of the same class from being created in one day" do
		class_1 = Session.create(afterschool_class_id: 1, date: Time.zone.now.to_date)
  	class_2 = Session.create(afterschool_class_id: 1, date: Time.zone.now.to_date)
  	Session.today.should include class_1
  	Session.today.should_not include class_2
  end
end



