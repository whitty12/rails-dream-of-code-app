require 'rails_helper'

RSpec.describe "Courses", type: :request do
    describe 'GET /courses/#show' do
      before do
        @current_trimester = Trimester.create!(
            term: 'Current term',
            year: Date.today.year.to_s,
            start_date: Date.today - 1.day,
            end_date: Date.today + 2.months,
            application_deadline: Date.today - 16.days
        )
        @ruby_class = CodingClass.create!(
            title: 'Ruby on Rails',
            description: 'Learn Ruby on Rails in this class.'
        )
        @ruby_course = Course.create!(
            trimester:@current_trimester,
            coding_class: @ruby_class
        )
        @enrolled_student = Student.create!(
            first_name: "AJ",
            last_name: "Suning",
            email: "aj@test.com"
        )
        @enrollment = Enrollment.create!(
            course: @ruby_course,
            student: @enrolled_student
        )
      end

      it 'displays the name of the course#show' do
        get '/courses/1'
        expect(response.body).to include("Ruby on Rails")
      end

      it 'display the term of the course#show' do
        get '/courses/1'
        expect(response.body).to include ("Current term")
      end

      it 'displays the name of a student enrolled in course#show' do
        get '/courses/1'
        expect(response.body).to include("#{@enrolled_student.first_name} #{@enrolled_student.last_name}")
      end
    end  
end