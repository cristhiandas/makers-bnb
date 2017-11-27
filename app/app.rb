ENV["RACK_ENV"] = "development"
require 'sinatra/base'
# require_relative 'models/picture'
# require_relative 'models/venue'


class Makersbnb < Sinatra::Base

  get '/' do
    redirect '/venue'
  end

  get '/venue' do
    erb :'venue'
  end

  get '/venue/new' do
    erb :'venue/new'
  end

  post '/venue' do
    venue = Venue.create(title: params[:title], address: params[:address],
                        price: params[:price], pictures: params[:image])
  end





  post '/links' do
  link = Link.create(title: params[:title], url: params[:url])
  params[:tags].split.each do |tag|
    link.tags << Tag.first_or_create(name: tag)
  end
  link.save
  redirect 'links'
end




end
