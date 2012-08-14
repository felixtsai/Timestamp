module AssignmentsHelper

  def percent_complete(assignment)
    (((StudentAssignment.all.select {|x| x.completion_time != nil && x.assignment_id == assignment.id }.count.to_f) / (StudentAssignment.all.select {|x| x.assignment_id == assignment.id}.count.to_f)) * 100).to_s + "%"
  end
end
