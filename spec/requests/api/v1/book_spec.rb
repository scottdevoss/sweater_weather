require "rails_helper"

RSpec.describe "Api::V1::Books", type: :request do
  it "will return the forecast and collection of books about the desination city" do
    get "/api/v1/book-search?location=denver,co&quantity=5"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    result = JSON.parse(response.body, symbolize_keys: true)
  end
end