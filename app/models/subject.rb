class Subject < ActiveRecord::Base
  attr_accessible :name
  has_many :assignments

  def subject_name
  	name  	
  end
end
