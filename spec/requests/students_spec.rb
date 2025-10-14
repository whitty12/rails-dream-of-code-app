require 'rails_helper'

RSpec.describe "Students", type: :request do
  describe "GET /students" do
    it "works! (now write some real specs)" do
      get students_path
      expect(response).to have_http_status(200)
    end

    let!(:student) { 
        Student.create(
          first_name: "KJ",
          last_name: "Loving",
          email: "kj@test.com"
        )
      }
      let!(:student2) { 
        Student.create(
          first_name: "AJ",
          last_name: "Suning",
          email: "aj@test.com"
        )
      }

      #write a test showing the index page is loading correctly
      it 'returns a page containing names of all students' do
        get '/students'
        expect(response.body).to include('KJ')
        expect(response.body).to include('AJ')
        expect(response.body).to include('kj@test.com')
      end

      
      #write a test showing the show page is loading correctly
      it 'returns a page containing the information of one student' do
        get '/students/1'
        expect(response.body).to include('KJ')
        expect(response.body).to include('kj@test.com')
        expect(response.body).not_to include('AJ')
        expect(response.body).not_to include('aj@test.com')
      end

  end
end
