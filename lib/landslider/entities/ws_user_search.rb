class Landslider
	
	class WsUserSearch < WsSearch
		
		# @return [String]
		attr_reader :user_name

		# @param [String] user_name a user name
		def initialize(user_name)
			@user_name = user_name
		end

		# @param [Handsoap::XmlMason::Node] msg
		# @return [Handsoap::XmlMason::Node]
		def soapify_for(msg)
			raise 'not implemented'
		end
	end
	
end
