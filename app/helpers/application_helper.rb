module ApplicationHelper
  def full_name(student)
    student.first_name + " " + student.last_name
  end

  def current_by_grade_level(assignments, selected_grade_id)
    assignments.select do |assignment|
      assignment.grade_level_id == selected_grade_id && assignment.due_date >= Time.zone.now.to_date
    end
  end

  def current_assignments(assignments)
      assignments.select{ |assignment| assignment.due_date > Time.zone.now.to_date }
    end
end
