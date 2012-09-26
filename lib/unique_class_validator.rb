class UniqueClassValidator < ActiveModel::Validator
	def validate(record)
		if Session.today.collect {|session| session.afterschool_class_id}.include? record.afterschool_class_id
			record.errors[:base] << "This class is already in session"
		end
	end
end				

