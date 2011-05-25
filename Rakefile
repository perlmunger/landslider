require 'rubygems'
require 'rake'

begin
	require 'jeweler'
	Jeweler::Tasks.new do |gem|
		gem.name = "landslider"
		gem.summary = "Landslide Ruby"
		gem.description = "Landslider is a ruby interface to the Landslide SOAP-based API"
		gem.license = "MIT"
		gem.email = "jay@j4y.net"
		gem.homepage = "https://github.com/j4y/landslider"
		gem.authors = ['Jay Prall']
		
		# dependencies listed in Gemfile
	end
	Jeweler::GemcutterTasks.new
rescue LoadError
	puts 'Jeweler not available.  Please install the jeweler gem'
end

# Load any rake files that exist
Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |f| load f } 

task :default => [:test]

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
	test.libs << 'lib' << 'test'
	test.pattern = 'test/**/*_test.rb'
	test.verbose = false
end

begin
	require 'yard'
	YARD::Rake::YardocTask.new
rescue LoadError
	puts 'Yard not available. Please install the yard gem'
end
