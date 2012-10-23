module StudentReportsHelper
  def self.alphabetize_by_last_name(students)
    students.sort { |a,b| a.last_name <=> b.last_name }
  end

end
