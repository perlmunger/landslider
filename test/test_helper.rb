require 'digest/md5'

# constants to be set by rails environment config files
LS_INSTANCE_NAME = 'jaytest'
LS_API_USERNAME = 'jayp@landslide.com'
LS_API_PASSWORD = 'Applogin1'
LS_API_KEY =  Digest::MD5.hexdigest(LS_API_PASSWORD + LS_INSTANCE_NAME)
LS_API_ENDPOINT = {
  :uri => "https://#{LS_INSTANCE_NAME}.api.landslide.com/webservices/SoapService",
  :version => 2
}

require 'test/unit'
require 'landslider'

