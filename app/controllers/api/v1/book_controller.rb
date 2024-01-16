class Api::V1::BookController < ApplicationController
  def search
    location = params[:location]

    conn = Faraday.new(url: "https://openlibrary.org") do |faraday|

    end

    response = conn.get("/search.json")

    data = JSON.parse(response.body, symbolize_keys: true)
      
  end
end