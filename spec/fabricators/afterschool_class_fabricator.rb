require 'ffaker'

Fabricator(:afterschool_class) do
  grade_level_id 1
  teacher_id     1
  student
end
