require "rails_helper"

RSpec.describe "Api::V0::Munchies", type: :request do
  describe "Happy path" do
    it "will retrieve variable food and forecast information for a destination city" do
      get "/api/v1/munchies?destination=pueblo,co&food=italian"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      
      result = JSON.parse(response.body, symbolize_keys: true)
    end 
  end
end