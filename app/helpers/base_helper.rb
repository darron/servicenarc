Admin.helpers do
		def node_stale(time)
		unless time.nil?
			checkin = Time.parse(time)
			if checkin > (Time.now - 86400)
				return "OK"
			else
				return "Late"
			end
		else
			return "No checkin yet."
		end
	end
end