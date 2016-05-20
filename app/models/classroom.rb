class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  # validates :student_id, presence: true
  # validates :student, presence: true, if: -> { student_id.present? }


  validates :student, presence: true, uniqueness: {scope: :course}

	  def name_student
		  	if self.student.blank?
		  		"-"
		  	else
		  		self.student.name
			end
		end

	  def name_course
		  	if self.course.blank?
		  		"-"
		  	else
		  		self.course.name
			end
		end
end
