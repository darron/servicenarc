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
      return "Found a service."
    else
      return "Nothing to see here."
    end
  end

end