class Landslider

	class WsAccountNoteSearch < WsSearch
		
		# @return [Integer]
		attr_reader :account_id
		
		# @param [Integer] account_id an account id
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