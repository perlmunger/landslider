require 'digest/md5'

namespace :landslider do

	desc "generate configuration for the landslide api"
	task :gen_config do

		# TODO: refactor and test
		def get_input
			$stdin.gets.to_s.chomp
		end

		print "Enter a Landslide instance name: "
		instance_name = get_input

		print "Enter your api username:"
		api_user = get_input

		print "Enter your api password:"
		api_password = get_input

		puts "LS_INSTANCE_NAME = '#{instance_name}'"
		puts "LS_API_USERNAME = '#{api_user}'"
		# api key is just an md5 hash of the api password and instance name
		puts "LS_API_KEY = '#{Digest::MD5.hexdigest(api_password + instance_name)}'"
	end
end
