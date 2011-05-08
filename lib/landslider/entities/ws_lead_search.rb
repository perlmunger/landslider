
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
			super(msg)
			msg.add 'name', @name unless @name.nil?
			msg.add 'accountId', @account_id unless @account_id.nil?
			msg.add 'companyId', @company_id unless @company_id.nil?
			msg.add 'primaryOwnerId', @primary_owner_id unless @primary_owner_id.nil?
		end
		
	end
	
end
