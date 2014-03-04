require File.expand_path('../bin/kankore.rb', __FILE__)

desc 'Default Work:Update All New Characters'
task :default => [:update]

desc 'Init And Check'
task :init do
  res_path = File.expand_path('../resources', __FILE__)
  Dir.mkdir(res_path) unless File.directory?res_path
  tmp_path = File.expand_path('../resources/tmp', __FILE__)
  Dir.mkdir(tmp_path) unless File.directory?tmp_path
end

desc 'Update All New Characters'
task :update do
  Rake::Task['update:new'].invoke
end

namespace :update do
  Rake::Task['init'].invoke

  task :new do
    KanKore.new.update('new')
  end

  desc 'Update One Specified Charater.(Usage: rake update:one[ship_id])'
  task :one, [:arg1] do |t, args|
    if args.count == 0
	  puts "rake update:one[arg1]"
	  puts "arg1: ship_id"
	else
	  KanKore.new.update('one', args[:arg1])
	end
  end
  
  desc 'Update All Charaters'
  task :all do
    KanKore.new.update('all')
  end
end

desc 'Remove all Charaters'
task :clear do
end

desc 'List All Characters(New Characters Specified)'
task :list do
  Rake::Task['init'].invoke
  #Rake::Task['list:all'].invoke
  kan.list(nil)
end

namespace :list do
  desc 'List All Characters'
  task :all do
  end

  desc 'List New Characters'
  task :new do
  end
end

