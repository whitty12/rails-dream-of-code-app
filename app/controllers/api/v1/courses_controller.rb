class Api::V1::CoursesController < ApplicationController

  def index
    @current_trimester = Trimester.where("start_date <= ?", Date.today).where("end_date >= ?", Date.today).first
    
    #initialize variable before loop
    courses_array = []
    
    @current_trimester.courses.each do |course|
        courses_array << course.attributes
    end

    courses_hash = {courses: courses_array}
    
    render json: courses_hash, status: :ok
  end
end