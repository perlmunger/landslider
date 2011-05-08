
class Landslider

	# search criteria for getLeads
	class WsLeadSearch < WsSearch
		
		# @return [Integer]
		attr_writer :account_id, :company_id, :primary_owner_id, :status_id
		
		# @return [Boolean]
		attr_writer :hot

		# @return [Date]
		attr_writer :updated_on

		# @return [String]
		attr_writer :name
		
		
		# @param [Handsoap::XmlMason::Node] msg
		# @return [Handsoap::XmlMason::Node]
		def soapify_for(msg)
			msg.add('contactsRequest') { |crit|
				super(crit)
				crit.add 'firstName', @first_name unless @first_name.nil?
				crit.add 'lastName', @last_name unless @last_name.nil?
				crit.add 'email', @email unless @email.nil?
				crit.add 'state', @state unless @state.nil?
			}
		end
		
	end
	
end
