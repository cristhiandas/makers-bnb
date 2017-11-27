class Favorite
  include DataMapper::Resource

  property :id, Serial

  has n, :users, through: Resource
end
