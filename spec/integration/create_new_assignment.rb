require 'spec_helper'

describe "creating an assignment" do
  it "allows me to create an assignment with a grade level and subject" do
    visit "assignments/new"
    select('6th Grade', :from => 'assignment[grade_level_id]')
    select('English', :from => 'assignment[subject_id]')
    fill_in "assignment[0][description]", :with => "Write an essay on Moby Dick"
    select("8/14/2012", :from => "assignment[0][due_date]" )
    click_button "Submit Assignment"
    page.should have_content "Assignments have been created and assigned to students!"
  end
end