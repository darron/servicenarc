class ServiceHit

  def store(url, node, ip, time)
    $redis.sadd "#{url}", "#{node}"
  end

  def self.list_members(url)
    $redis.smembers "#{url}"
  end

end