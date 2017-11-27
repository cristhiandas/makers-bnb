require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/picture'
require_relative 'models/venue'

require 'models/user'
require 'models/favorites'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
