require "rails_helper"

RSpec.describe "Api::V0::Forecast", type: :request do
  describe "Happy path" do
    it "generates the forecast based on location", :vcr do
      get "/api/v0/forecast?location=cincinatti,oh"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      
      result = JSON.parse(response.body, symbolize_keys: true)
      # require 'pry'; binding.pry
    end 
  end
end