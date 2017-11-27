ENV["RACK_ENV"] = "development"
require 'sinatra/base'
require_relative 'dm_setup'


class Makersbnb < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/venue'
  end

  get '/venue' do
    erb :'venue/index'
  end

  get '/venue/new' do
    erb :'venue/new'
  end

  post '/venue' do
    Venue.first_or_create(title: params[:title], address: params[:address],
                        price: params[:price])
    #p (venue)
    # venue.pictures << Picture.first_or_create(picture: params[:image])
    # venue.save
    redirect '/venue'
  end



end
