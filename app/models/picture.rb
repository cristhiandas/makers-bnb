class Picture

  include DataMapper::Resource

  property :id, Serial
  property :path,   FilePath, :required => true


  has 1, :venue, through: Resource

end
