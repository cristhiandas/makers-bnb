ENV["RACK_ENV"] = "development"
require 'sinatra/base'
require_relative 'dm_setup'

class Makersbnb < Sinatra::Base
enable :sessions
get '/sign_up' do
  erb :sign_up
end

post '/user' do
  p params[:username]
  p params[:email]
  p params[:password]
  User.first_or_create(name: params[:username], email: params[:email], password: params[:password])
end
end
