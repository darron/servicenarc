Servicenarc.controller do

  get '/:url/:node' do
    url = CGI::unescape(params[:url])
    node = CGI::unescape(params[:node])
    begin
      service = Service.first(:url => url)
    rescue
      # Rescue stuff to come here.
    end
    
    unless service.nil?
      hit = ServiceHit.new
      hit.store(service.url, node, request.ip, Time.now.utc)
      return 200
    else
      return "Nothing to see here."
    end
  end

  get "/sendmail" do
    email do
      @services = Service.all
      @nodes = Hash.new
      @checkins = Hash.new
      @services.each do |service|
        @nodes[service.url] = ServiceHit.list_members(service.url)
      end
      @nodes.each do |url, node|
        @checkins[url] = ServiceHit.nodes_checkin_list(url, node)
      end
      from "darron@froese.org"
      to "darron@froese.org"
      subject "Daily Servicenarc"
      body render('status')
      content_type :html
      via :smtp
    end
  end

end