class Weather
  attr_reader :id, :data
  def initialize(data)
    @data = data
    @id = nil
  end

  def current_weather
    current = {}
    current[:last_updated] = @data[:current][:last_updated]
    current[:temperature] = @data[:current][:temp_f]
    current[:feels_like] = @data[:current][:feelslike_f]
    current[:humidity] = @data[:current][:humidity]
    current[:uvi] = @data[:current][:uv]
    current[:visibility] = @data[:current][:vis_miles]
    current[:condition] = @data[:current][:condition][:text]
    current[:icon] = @data[:current][:condition][:icon]
    current
  end

  def daily_weather
    daily = []
    @data[:forecast][:forecastday].each do |date|
      daily << {
        date: date[:date],
        sunrise: date[:astro][:sunrise],
        sunset: date[:astro][:sunset],
        max_temp: date[:day][:maxtemp_f],
        min_temp: date[:day][:mintemp_f],
        condition: date[:day][:condition][:text],
        icon: date[:day][:condition][:icon],
      }
    end
    daily
  end

  def hourly_weather
    hourly = []
    @data[:forecast][:forecastday][0][:hour].each do |each_hr|
      hourly << {
        time: DateTime.parse(each_hr[:time]).strftime("%H:%M"),
        temperature: each_hr[:temp_f],
        conditions: each_hr[:condition][:text],
        icon: each_hr[:condition][:icon]
      }
    end
    hourly
  end
end