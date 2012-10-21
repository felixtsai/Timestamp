module StudentReportsHelper
  def self.alphabetize(students)
    students.sort { |a,b| a.last_name <=> b.last_name }
  end
end
