ENV["RACK_ENV"] = "development"
require 'sinatra/base'
# require_relative 'models/picture'
# require_relative 'models/venue'


class Makersbnb < Sinatra::Base

  get '/' do
    "hello"
  end

  get '/venue' do
    erb :venue
  end

end
