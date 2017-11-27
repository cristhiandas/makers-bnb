ENV["RACK_ENV"] = "development"

require 'sinatra/base'
require_relative 'dm_setup'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/sign_up' do
    erb :sign_up
  end

  get '/welcome' do
    erb :welcome
  end

  post '/user' do
    User.first_or_create(name: params[:username], email: params[:email], password: params[:password])
    # binding.pry
    redirect '/welcome'
  end
end
