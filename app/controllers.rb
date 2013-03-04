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

    # Get all the addresses for the email.
    emails = Array.new
    people = Account.all
    people.each do |person|
      emails << person.email.to_s
    end

    emails.each do |email_address|
      email do

        # Get all the information for the email.
        @services = Service.all
        @nodes = Hash.new
        @checkins = Hash.new
        @services.each do |service|
          @nodes[service.url] = ServiceHit.list_members(service.url)
        end
        @nodes.each do |url, node|
          @checkins[url] = ServiceHit.nodes_checkin_list(url, node)
        end

        # Send the email.
        from ENV['EMAIL_FROM']
        to email_address
        subject "Daily Servicenarc"
        body render('status')
        content_type :html
        via :smtp
      end
    end
    return 'OK'
  end

end