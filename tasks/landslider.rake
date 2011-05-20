require 'digest/md5'

namespace :landslider  do

	desc "generate api key for use with the landslider gem"
	task :config do

		# TODO: refactor into helper for testability

		print "Enter a Landslide instance name: "
		instance_name = $stdin.gets.to_s.chomp

		print "Enter your api username:"
		api_user = $stdin.gets.to_s.chomp

		print "Enter your api password:"
		api_password = $stdin.gets.to_s.chomp

		puts "LS_INSTANCE_NAME = '#{instance_name}'"
		puts "LS_API_USERNAME = '#{api_user}'"
		# api key is just an md5 hash of the api password and instance name
		puts "LS_API_KEY = '#{Digest::MD5.hexdigest(api_password + instance_name)}'"
	end
end
