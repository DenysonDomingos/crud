class ClassroomsController < ApplicationController

  before_action :set_classroom, only: [:show, :edit, :update, :destroy]
  before_action :set_course, only: [:edit, :new]
  before_action :set_student, only: [:edit, :new]

  # GET /classrooms
  # GET /classrooms.json
  def index
    @classrooms = Classroom.all
    respond_with(@classrooms)
  end

  # GET /classrooms/1
  # GET /classrooms/1.json
  def show
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
    respond_with(@classrooms)
  end

  # GET /classrooms/1/edit
  def edit
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = Classroom.new(classroom_params)
    @classroom.save
    respond_with(@classroom, :location => @classroom)
  end

  # PATCH/PUT /classrooms/1
  # PATCH/PUT /classrooms/1.json
  def update
    @classroom.update(classroom_params)
    respond_with(@classroom)
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @classroom.destroy
    respond_with(@classroom, :location => @classroom)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_params
      params.require(:classroom).permit(:student_id, :course_id)
    end

    def set_course
      @courses = Course.all
    end

    def set_student
      @students = Student.all
    end    
end
