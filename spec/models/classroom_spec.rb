require 'rails_helper'

RSpec.describe Classroom, type: :model do
  	context "Validade de um Usuario" do
  		it "Usuario valido?"do 

  		  classroom = Classroom.new
  		  classroom.student_id = "1"
  		  classroom.course_id = "1"

  		  expect(classroom.valid?).to be_truthy
  		end
	end
end
