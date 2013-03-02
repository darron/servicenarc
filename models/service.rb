require "digest/sha1"

class Service
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :description, String
  property :url, String

  validates_presence_of	:name
  validates_uniqueness_of :url

  before :create, :create_url

  def create_url
  	self.url = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end
