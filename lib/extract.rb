module Extract
  def self.extract_object(file_path, id, extract_mode, object_id) 
    #puts file_path	  
    extract_mode ||= 'j'
	object_id ||= ''
    extract_hash = { j: 'JPEG', p: 'PNG', f: 'Frame', s: 'Sound', F: 'Font'} 
	swfextract_path = File.expand_path('../swfextract', __FILE__)
	file_dir = File.dirname(file_path);

	swf_info = `#{swfextract_path} #{file_path}`
	puts swf_info

    count = swf_info[/(?<=\[-#{extract_mode}\]\s)(\d)+(?=\s#{extract_hash[extract_mode.to_sym]})/]
    object_id = swf_info[/(?<=#{extract_hash[extract_mode.to_sym]}(.):\sID\(s\)\s)(.)+/] if object_id.empty?

	object_id.scan(/\d+/) do |object|
	  puts "Getting object#{object} from #{id}.swf..."
	  `#{swfextract_path} -#{extract_mode} #{object} #{file_path}`
	  change_name =<<-COMMAND
		for files in output.*; do
		  mv $files #{file_dir}
		done
	    for files in #{file_dir}/output.*; do
          mv $files `echo $files | sed "s/output/#{object}/g"`;
		done
	  COMMAND
	  `#{change_name}`
	end
  end
end

#Extract::extract_object('309.swf', '309', 'j', '')
