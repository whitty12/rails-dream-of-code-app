require 'rails_helper'

RSpec.describe 'Dashboard', type: :request do
  describe 'GET /dashboard' do
    before do
     current_trimester = Trimester.create!(
       term: 'Current term',
       year: Date.today.year.to_s,
       start_date: Date.today - 1.day,
       end_date: Date.today + 2.months,
       application_deadline: Date.today - 16.days
     )
     upcoming_trimester = Trimester.create!(
       term: 'Upcoming term',
       year: Date.today.year.to_s,
       start_date: Date.today + 6.months,
       end_date: Date.today + 8.months,
       application_deadline: Date.today - 16.days
     )
     # Define past_trimester here and uncomment it when you're ready.
     past_trimester = Trimester.create!(
       term: 'Past term',
       year: '2025',
       start_date: Date.today - 8.months,
       end_date: Date.today - 6.months,
       application_deadline: Date.today - 16.days
     )
     ruby_class = CodingClass.create!(
      title: 'Ruby on Rails',
      description: 'Learn Ruby on Rails in this class.'
     )
     Course.create!(
      trimester:current_trimester,
      coding_class: ruby_class
     )
    #for testing upcoming trimester
     react_class = CodingClass.create!(
      title: "React",
      description: 'Learn React in this class.'
     )
     Course.create!(
      trimester: upcoming_trimester,
      coding_class: react_class
     )    
    end
    
    it 'returns a 200 OK status' do
      # Send a GET request to the dashboard route
      get "/dashboard"

      # Check that the response status is 200 (OK)
      expect(response).to have_http_status(:ok)
    end

    it 'displays the current trimester' do
      get "/dashboard"
      expect(response.body).to include("Current term - 2025")
    end

    it 'displays links to the courses in the current trimester' do
      get "/dashboard"
      expect(response.body).to include("Ruby on Rails")
    end

    it 'displays the upcoming trimester' do
      get "/dashboard"
      expect(response.body).to include("Upcoming term - 2025")
    end

    it 'displays links to the courses in the upcoming trimester' do
      get "/dashboard"
      expect(response.body).to include("React")
    end
  end
end