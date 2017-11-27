require 'data_mapper'
require 'dm-postgres-adapter'

require 'models/user'
require 'models/favorites'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
