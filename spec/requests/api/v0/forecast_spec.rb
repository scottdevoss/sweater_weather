require "rails_helper"

RSpec.describe "Api::V0::Forecast" do
  describe "#search" do
    it "generates the forecast based on location" do
      get "/api/v0/forecast", params: { location: 'cincinnati,oh' }

      expect(response).to be_successful
      
      forecast = JSON.parse(response.body, symbolize_keys: true)
    end 
  end
end