require "rails_helper"

RSpec.describe "Api::V1::Books", type: :request do
  it "will return the forecast and collection of books about the desination city" do
    get "/api/v1/book-search?location=denver,co&quantity=5"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    result = JSON.parse(response.body, symbolize_keys: true)
  end
end

# {
#   "data": {
#     "id": "null",
#     "type": "books",
#     "attributes": {
#       "destination": "denver,co",
#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "83 F"
#       },
#       "total_books_found": 172,
#       "books": [
#         {
#           "author_name": [
#             "Joe Bethersonton",
#             "C.J. Cregg"
#           ],
#           "title": "Denver, Co",
#           "publisher": [
#             "West Wing Publishing Co."
#           ]
#         {
#           "author_name": [
#             "Luft, Werner"
#           ],
#           "title": "Photovoltaic safety, Denver, CO, 1988",
#           "publisher": [
#             "American Institute of Physics"
#           ]
#         },
#         { ... same format for any books up to the quantity limit ... }
#       ]
#     }
#   }
# }