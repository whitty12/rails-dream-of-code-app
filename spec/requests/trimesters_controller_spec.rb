require 'rails_helper'

RSpec.describe "Trimesters", type: :request do
  describe "GET /trimesters" do
    context 'trimesters exist' do
      before do
        (1..2).each do |i|
          Trimester.create!(
            term: "Term #{i}",
            year: '2025',
            start_date: '2025-01-01',
            end_date: '2025-01-01',
            application_deadline: '2025-01-01',
          )
        end
      end

      it 'returns a page containing names of all trimesters' do
        get '/trimesters'
        expect(response.body).to include('Term 1 2025')
        expect(response.body).to include('Term 2 2025')
      end
    end
    
    #trimesters do not exist context
    context 'trimesters do not exist' do
      before do
        #do not create any trimesters
      end

      it 'returns a page that does not contain names of all trimesters' do
        get '/trimesters'
        expect(response.body).not_to include('<li>')
        expect(response.body).to include("<h1>Trimesters</h1>")
      end
    end
  end


  describe "PUT /trimesters" do
    context 'updating trimesters' do
      before do
        @trimester = Trimester.create!(
          term: "Term 1",
          year: "2025",
          start_date: "2025-01-01",
          end_date:"2025-01-01",
          application_deadline: "2025-01-01"
        )
      end

      #updated attributes being test in put request
      let(:updated_attributes) { 
        { 
          trimester: 
          { 
            trimester_id:1 , 
            application_deadline: '2025-01-02'
          } 
        } 
      }

      #When a PUT request is made with an application deadline that is a valid date, 
      #and a trimester exists for the trimester id  included in the request, 
      #a trimester's application deadline is updated as expected (per request data)
      it 'updates the application deadline if it is valid' do
        put edit_trimester_path(@trimester), params: updated_attributes

        expect(response.body).to include("2025-01-02")   
      end


      #attributes with no application deadline
      let(:no_deadline_attribute) { 
        { 
          trimester: 
          { 
            trimester_id:1 , 
            application_deadline: nil
          } 
        } 
      }

      #When a PUT request is made without an application deadline, 
      #the test expects the response status to be 400 (or :bad_request).
      it 'return bad request without an application deadline' do
        put trimester_path(@trimester), params: no_deadline_attribute

        expect(response).to have_http_status(:bad_request)
      end


      #attributes with bad application deadline
      let(:bad_deadline_attribute) { 
        { 
          trimester: { 
            trimester_id:1, 
            application_deadline: 100.0
          } 
        } 
      }

      #When a PUT request is made and the application deadline is not a valid date, 
      #the test expects the response status to be 400 (or :bad_request).
      it 'return bad request without a VALID application deadline' do
        put trimester_path(@trimester), params: bad_deadline_attribute

        expect(response).to have_http_status(:bad_request)
      end

      #When a PUT request is made to a route with a trimester id that does not belong to an existing trimester, 
      #the test expects the response status to be 404 (or :not_found)
      it 'returns a bad request when the request does not belong to an existing trimester'  do
        put '/trimesters/3/edit'
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end