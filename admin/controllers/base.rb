Admin.controllers :base do

  get :index, :map => "/" do
  	@services = Service.all
  	@nodes = Hash.new
  	@checkins = Hash.new
  	@services.each do |service|
  		@nodes[service.url] = ServiceHit.list_members(service.url)
  	end
  	@nodes.each do |url, node|
  		@checkins[url] = ServiceHit.nodes_checkin_list(url, node)
  	end
    render "base/index"
  end
end
