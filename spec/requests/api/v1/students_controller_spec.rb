require 'rails_helper'

RSpec.describe "Api::V1::Students", type: :request do
  describe "POST /api/v1/students" do
    let(:valid_attributes) do
      {
        student: {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: 'validstudent@example.com'
        }
      }
    end
    let(:invalid_attributes) do
      {
        student: {
          name: 104951,
          last: 1039489235,
          email: 'invalidtest@example.com'
        }
      }
    end

    it "creates a new student" do
      expect {
        post '/api/v1/students', params: valid_attributes
      }.to change(Student, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['student']['email']).to eq("validstudent@example.com")
    end

    it "throws an error from invalid attributes" do
      post '/api/v1/students', params: invalid_attributes
      expect(response).to have_http_status(:unprocessable_entity)
    end

  end
end
