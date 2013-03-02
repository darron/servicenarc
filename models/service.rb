class Service
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :description, String
  property :url, String
end
