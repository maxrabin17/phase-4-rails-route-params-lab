class StudentsController < ApplicationController

  def index
    if params[:name]
      students = Student.all.filter do |student|
        student.first_name.downcase.include?(params[:name].downcase) || student.last_name.downcase.include?(params[:name].downcase)
      end

      render json: students
    else
      students = Student.all
      render json: students
    end
  end

  def show
    student = Student.find_by(id: params[:id])
    render json: student
  end

end
