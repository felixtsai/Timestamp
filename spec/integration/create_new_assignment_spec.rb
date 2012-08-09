require 'spec_helper'

describe "creating an assignment" do
  it "allows me to create an assignment with a grade level and subject" do
    visit "/assignments/new"
    page.should have_content("Create new assignment")
    select('6th Grade', :from => 'assignment[grade_level_id]')
    select('Math', :from => 'assignment[subject_id]')
    fill_in "assignment[0][description]", :with => "Write an essay on Moby Dick"
    select('August', :from => "assignment[0][due_date(2i)]")
    select('8', :from => "assignment[0][due_date(3i)]")
    select('2012', :from => "assignment[0][due_date(1i)]")
    click_button "Create Assignment"
    page.should have_content("Assignments added")
  end
end