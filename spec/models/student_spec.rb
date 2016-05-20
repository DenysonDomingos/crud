require 'rails_helper'

RSpec.describe Student, type: :model do
  	
    context "Testando a View Student" do
      it "Cadastrar um aluno" do
         student = Student.all
         size_old = student.size

         visit '/students/new'
          
          within("#new_student") do
            fill_in 'Nome', :with => 'Carlos'
            fill_in 'Numero de Registro', :with => '1389.21891.232'
          end

        click_button 'Criar Aluno'
        expect(page).to have_content 'Aluno criado com sucesso.'
      
        student = Student.all
        expect(student.size).to eql(size_old + 1)
      end    
    end


    context "Valida se nome e numero de registro estao preenchidos" do
  		it "Nome e numero registro do estudante preenchidos"do 

  		  student = Student.new
  		  student.name = "Test"
  		  student.register_number = "1234.3113.1121"

  		  expect(student.valid?).to be_truthy
  		end

  		it "Nome do estudante não preenchidos, invalido"do 

  		  student = Student.new
  		  student.name = nil
  		  student.register_number = "1234.3113.1121"

  		  expect(student.valid?).to be_falsey
  		end

  		it "Numero de Registro do estudante não preenchidos, invalido"do 

  		  student = Student.new
  		  student.name = "Maria"
  		  student.register_number = nil

  		  expect(student.valid?).to be_falsey
  		end

	end
end
