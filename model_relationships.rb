users:
one dude


day_classes:
belongs_to :subject
belongs_to :grade_level
belongs_to :teacher (or has one?)
has_many :students, :through => :classes_students


afterschool_classes:
attr_accessible :grade_level_id
has_many :students
has_many :sessions
has_one :teacher
belongs_to :grade_level


students:
attr_accessible :afterschool_class_id, :first_name, :grade_level_id, :last_name

belongs_to :grade_level
belongs_to :afterschool_class
has_many :assignments, :through => :student_assignments


teachers:
attr_accessible :first_name, :last_name

belongs_to :afterschool_class


grade_levels:
attr_accessible :year
has_many :students
has_many :afterschool_classes


subjects:



assignments:



attendance:



student_assignments:



classes_students: