ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'dm_setup'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/sign_up' do
    erb :sign_up
  end

  get '/' do
    redirect '/venue'
  end

  get '/venue' do
    @venues = Venue.all
    erb :'venue/index'
  end

  get '/venue/new' do
    erb :'venue/new'
  end

  post '/venue' do
    venue = Venue.first_or_create(user_id: session[:user], title: params[:title], address: params[:address], price: params[:price])
    venue_id = venue.id
    venue.pictures << Picture.first_or_create(path: params[:picture], venue_id: venue_id)
    venue.save
    redirect '/venue'
  end

  get '/welcome' do
    erb :welcome
  end

  post '/user' do
    user = User.first_or_create(name: params[:username], email: params[:email], password: params[:password])
    session[:user] = user.id
    p user.id
    redirect '/welcome'
  end
end
