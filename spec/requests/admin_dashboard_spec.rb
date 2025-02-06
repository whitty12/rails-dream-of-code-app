require 'rails_helper'

RSpec.describe 'Dashboard', type: :request do
  describe 'GET /dashboard' do
    it 'returns a 200 OK status' do
      # Send a GET request to the dashboard route
      get "/dashboard"

      # Check that the response status is 200 (OK)
      expect(response).to have_http_status(:ok)
    end

    it 'displays the current trimester' do
      get "/dashboard"
      expect(response.body).to include('Dashboard')
    end

    it 'displays links to thecourses in the current trimester' do
    end

    it 'displays the upcoming trimester' do
    end

    it 'displays links to the courses in the upcoming trimester' do
    end

  end
end
