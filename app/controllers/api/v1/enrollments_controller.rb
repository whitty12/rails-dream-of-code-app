class Api::V1::EnrollmentsController < ApplicationController

    def index
        #Get the current trimester
        @current_trimester = Trimester.where("start_date <= ?", Date.today).where("end_date >= ?", Date.today).first
        #get current courses by course_id in the current trimester
        @current_course = @current_trimester.courses.find_by(params[:course_id])
        
        #initialize variable
        enrollments_array = []
        
        #for the course_id, hash each enrollment and merge
        @current_course.enrollments.each do |enrollment|
            #convert the enrollment object to a hash and merge into the array
            enrollments_array << enrollment.attributes
        end

        enrollments_hash = {enrollments: enrollments_array}

        render json: enrollments_hash, status: :ok
    end
end