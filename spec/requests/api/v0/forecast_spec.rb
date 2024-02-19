require "rails_helper"

RSpec.describe "Mapquest and Weather API", type: :request do
  it "retrieves weather for a city" do

    get "/api/v0/forecast?location=cincinatti,oh"

    expect(response).to be_successful

    
  end
end