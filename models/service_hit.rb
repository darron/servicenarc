class ServiceHit

  def store(url, node, ip, time)
    $redis.multi do
      $redis.sadd "#{url}", "#{node}"
      $redis.lpush "#{url}-#{node}", "#{time}"
      $redis.ltrim "#{url}-#{node}", 0, 29      
    end
  end

  def self.list_members(url)
    string = String.new
    nodes = $redis.smembers "#{url}"
  end

  def self.node_length(url, node)
    $redis.llen "#{url}-#{node}"
  end

  def self.last_checkin(url, node)
    $redis.lindex "#{url}-#{node}", 0
  end

  def self.nodes_checkin_list(url, nodes)
    checkins = Hash.new
    nodes.each do |node|
      last = self.last_checkin(url, node)
      checkins[node] = last
    end
    return checkins
  end

end