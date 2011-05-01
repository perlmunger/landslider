#!/usr/bin/env ruby
require 'digest/md5'

LS_INSTANCE_NAME = 'jaytest'
LS_API_PASSWORD = 'letmein52'
# the api key is an md5 hash of the user password string + instance name
puts "LS_API_KEY = '#{Digest::MD5.hexdigest(LS_API_PASSWORD + LS_INSTANCE_NAME)}'"
