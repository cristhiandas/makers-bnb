class Favorite
  include DataMapper::Resource

  property :id, Serial

  belongs_to :user
  has n, :venues, through: Resource

end
