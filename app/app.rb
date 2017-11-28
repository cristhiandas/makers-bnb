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
    @name = session[:name]
    erb :'venue/index'
  end

  get '/venue/new' do
    erb :'venue/new'
  end

  post '/venue' do
    venue = Venue.first_or_create(user_id: session[:user], title: params[:title], address: params[:address], price: params[:price])
    # venue.pictures << Picture.first_or_create(picture: params[:image])
    # venue.save
    redirect '/venue'
  end


  get '/welcome' do
    erb :welcome
  end

  post '/user' do
    user = User.create(name: params[:username], email: params[:email],
                      password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user] = user.id
    redirect '/sign_up' if user.id.nil?
    redirect '/welcome'
  end
end
