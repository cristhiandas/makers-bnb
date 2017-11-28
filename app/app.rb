ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'dm_setup'

class Makersbnb < Sinatra::Base
  use Rack::MethodOverride
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
    user = session[:user_id]
    user.venues << Venue.first_or_create(
       title: params[:title], address: params[:address],
        price: params[:price], description: params[:description])
    venue.pictures << Picture.first_or_create(path: params[:picture])
    venue.save
    user.save
    redirect '/venue'
  end

  get '/welcome' do
    erb :welcome
  end

  delete '/user' do
    session[:user_id] = nil
  session[:name] = nil
  # flash.keep[:notice] = 'goodbye!'
  redirect to '/'
  end

  post '/user' do
    user = User.create(name: params[:username], email: params[:email],
                      password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    session[:name] = user.name
    redirect '/sign_up' if user.id.nil?
    redirect '/venue'
  end

  get '/view/:name' do
    @venues = Venue.all(title: params[:name])
    erb :'venue/venue_page'
  end
end
