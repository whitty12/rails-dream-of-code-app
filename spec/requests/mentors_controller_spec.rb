require 'rails_helper'

#Referenced this stack overflow: https://stackoverflow.com/questions/20197271/how-should-i-test-routes-and-controllers-with-rspec
#Questions: How would this be written with a :request? Why do I HAVE to include the id to have this function? I wasn't able to find a good answer anywhere.

RSpec.describe "mentors routing", type: :routing do
    describe "GET /mentors" do
        #I'm assuming this is the list file?
        it 'routes GET /mentors to mentors#index' do
            expect(get: '/mentors').to route_to(controller: 'mentors', action:'index')
        end
    end

    describe "GET /mentors routing for #show" do
        it 'routes to mentors#show' do
            expect(get: '/mentors/1').to route_to(controller: 'mentors', action: 'show', id: '1')
        end
    end
end