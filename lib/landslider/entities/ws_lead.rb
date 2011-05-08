
class Landslider

	class WsLead < WsEntity
		
		# @return [Integer]
		attr_reader :lead_id, :account_id, :target_id, :created_by, :primary_owner_id
		
		# @return [String]
		attr_reader :name, :account_name, :description, :source_system_id

		# @return [Boolean]
		attr_reader :hot, :ok_to_call, :ok_to_email
		
		# @return [WsLeadTarget]
		attr_reader :lead_target

		# @return [WsContact]
		attr_reader :lead_contact
		
		# @return [WsLeadRating]
		attr_reader :lead_rating
		
		# @return [WsLeadStatus]
		attr_reader :lead_status
				
		# @return [WsLeadSource]
		attr_reader :lead_source
		
		# @return [WsSellingProcess]
		attr_reader :lead_selling_process
		
	end
	
end
