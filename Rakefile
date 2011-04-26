require 'rubygems'
require 'rake'

begin
	require 'jeweler'
	Jeweler::Tasks.new do |gemspec|
		gemspec.name = "landslider"
		gemspec.summary = "Landslide Ruby"
		gemspec.description = "Landslider is a ruby interface to the Landslide SOAP-based API"
		gemspec.email = "jayprall@gmail.com"
		gemspec.homepage = "https://github.com/j4y/landslider"
		gemspec.add_dependency("handsoap", ">= 1.1.8")	
		gemspec.authors = ['Jay Prall']
	end
	Jeweler::GemcutterTasks.new
rescue LoadError
	puts "Jeweler not available.  Please install the jeweler gem"
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

