class Picture
include DataMapper::Resource

  property :id, Serial
  property :path,   FilePath, :required => true
  property :venue_id, Integer
  # property :md5sum, String,   :length => 32, :default => lambda { |r, p| Digest::MD5.hexdigest(r.path.read) if r.path }

  belongs_to :venue

end
