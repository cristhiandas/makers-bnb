ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'dm_setup'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/sign_up' do
    erb :sign_up
  end

  get '/' do
    erb :index
  end

  post '/' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      session[:name] = user.name
      redirect '/venue'
    else
      # flash.now[:errors] = ['The email or password is incorrect']
      erb :index
    end
  end

  get '/venue' do
    @venues = Venue.all
    @name = session[:name]
    erb :'venue/index'
  end

  get '/venue/new' do
    erb :'venue/new'
  end

  post '/venue' do
    user = User.get(session[:user_id])
    venue = Venue.first_or_create(
       title: params[:title], address: params[:address],
        price: params[:price], description: params[:description])
    venue.pictures << Picture.first_or_create(path: params[:picture])
    venue.save
    user.venues << venue
    user.save
    redirect '/venue'
  end

  post '/user' do
    user = User.create(name: params[:username], email: params[:email],
                      password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/sign_up' if user.id.nil?
    redirect '/venue'
  end

  get '/view/:name' do
    @venues = Venue.all(title: params[:name])
    erb :'venue/venue_page'
  end
end
