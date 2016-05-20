class Student < ActiveRecord::Base
	has_many :classrooms

	validates :name, presence: true
	validates :register_number, presence: true, uniqueness: true

	before_destroy :validate_classroom_existance

	  private
	    def validate_classroom_existance
	      if !classrooms.empty?
	        errors[:base] <<  ""
	        return false
	      end
	    end
end
