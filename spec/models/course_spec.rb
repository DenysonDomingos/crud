require 'rails_helper'

RSpec.describe Course, type: :model do
  	
    context "Testando a View Course" do
      it "Cadastrar um curso" do
         course = Course.all
         size_old = course.size

         visit '/courses/new'
          
          within("#new_course") do
            fill_in 'Nome', :with => 'Churrasco'
            fill_in 'Descrição', :with => 'Carne vermelha'
          end

        click_button 'Criar Curso'
        expect(page).to have_content 'Curso criado com sucesso.'
      
        course = Course.all
        expect(course.size).to eql(size_old + 1)
      end    
    end


    context "Valida se nome e escrição estao preenchidos" do
  		it "Nome e descrição do curso preenchidos"do 

  		  course = Course.new
  		  course.name = "Test"
  		  course.description = "test test test"

  		  expect(course.valid?).to be_truthy
  		end

  		it "Nome do curso não preenchidos, invalido"do 

  		  course = Course.new
  		  course.name = nil
  		  course.description = "test test test"

  		  expect(course.valid?).to be_falsey
  		end

  		it "Descrição do curso não preenchidos, invalido"do 

  		  course = Course.new
  		  course.name = "Informatica"
  		  course.description = nil

  		  expect(course.valid?).to be_falsey
  		end

	end
end
