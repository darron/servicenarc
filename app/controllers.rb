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

end