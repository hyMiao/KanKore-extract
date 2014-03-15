require 'yaml'
require File.expand_path('../../lib/mynet.rb', __FILE__)
require File.expand_path('../../lib/extract.rb', __FILE__) 

include MyNet
include Extract

class KanKore
  def initialize
    #@chracters = YAML.load(File.open(File.expand_path('../../resources/characters.yaml', __FILE__)))
  end

  def update(mode, *id)
    mode ||= 'new'
    id ||= ''
      
    catch :exit do
      case mode
      when 'one'
        throw :exit if id.empty?

        id = id.pop
        path = File.expand_path("../../resources/#{id}/", __FILE__)

	tmp_dir = File.expand_path('../../resources/tmp', __FILE__)
	result = MyNet::download(id, tmp_dir << '/')
	throw :exit unless result

	extract(tmp_dir, path, id)
      when 'all' 
        (1..480).each do |id|
          path = File.expand_path("../../resources/#{id}", __FILE__)

          tmp_dir = File.expand_path('../../resources/tmp', __FILE__)
          result = MyNet::download(id, tmp_dir << '/')
          next unless result

          extract(tmp_dir, path, id)
	  puts "Extract #{id}.swf completely."
	end
      else
	(1..480).each do |id|
	  file = File.expand_path("../../resources/#{id}/#{id}.swf", __FILE__)
	  if File.exists?file
	    puts "#{id}.swf has been extracted."  
	    next
	  end

	  tmp_dir = File.expand_path('../../resources/tmp', __FILE__)
	  result = MyNet::download(id, tmp_dir << '/')
	  next unless result

	  path = File.expand_path("../../resources/#{id}", __FILE__)
          extract(tmp_dir, path, id)
	  puts "Extract #{id}.swf completely."
	end
      end
    end
  end

  def clear
  end

  def list(mode)
    mode ||= ''
      
    puts "test"

  end

  private

  def extract(tmp_dir, path, id) 
    file_path = tmp_dir 
    Dir.mkdir(path) unless File.directory?path    
    `mv #{file_path} #{path}`

    Extract::extract_object(path << '/' << "#{id}.swf", "#{id}", 'j', '')  
  end

end

#KanKore.new.update('one', '558')
