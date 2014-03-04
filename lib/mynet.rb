require 'net/http'
require 'open-uri'

module MyNet
  def self.download(image_id, dir) 
    image_url = 'http://203.104.105.167/kcs/ships/' << image_id.to_s << '.swf'
	dir ||= File.expand_path("../../resources/tmp/", __FILE__)

    res = Net::HTTP.get_response(URI(image_url))
    if res.is_a?(Net::HTTPSuccess)
	  puts "Get #{image_id}.swf ..."
	  File.open(dir << "#{image_id}.swf", 'wb') do |file|
	    file << res.body
	  end
	  return true
	else
	  puts "Connection Failed.Get #{image_id}.swf Failed."
	  return false
	end
  end
end

#MyNet::download('306')
