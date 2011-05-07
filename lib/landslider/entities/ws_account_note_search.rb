class Landslider

	class WsAccountNoteSearch < WsSearch
		attr_reader :account_id
		
		def initialize(account_id)
			@account_id = account_id
		end
		
		# @param [Handsoap::XmlMason::Node] msg
		# @return [Handsoap::XmlMason::Node]
		def soapify_for(msg)
			msg.add('accountNoteSearch') { |crit|
				crit.add 'accountId', @account_id
				super(crit)
			}
		end
	end
	
end