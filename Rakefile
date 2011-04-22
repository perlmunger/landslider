require 'rubygems'
require 'rake'

begin
	require 'jeweler'
	Jeweler::Tasks.new do |gemspec|
		gemspec.name = "landslider"
		gemspec.summary = "Ruby interface to Landslide SOAP API"
		gemspec.description = "Ruby interface to Landslide SOAP API. "
		gemspec.email = "jayprall@gmail.com"
		gemspec.authors = ['Jay Prall']
	end
	Jeweler::GemcutterTasks.new
rescue LoadError
	puts "Jeweler not available.  Please install the jeweler gem"
end

# Load any rake files that exist
Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |f| load f } 
