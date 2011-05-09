
class Landslider

	class WsOpportunity < WsPrimaryEntity
		
		# @return [Integer]
		attr_reader :opportunity_id, :created_by, :archived_by, :current_phase_id
		
		# @return [Integer]
		attr_reader :confidence, :primary_owner_id
		
		# @return [String]
		attr_reader :name, :account_name, :description, :current_phase_name

		# @return [String]
		attr_reader :description, :source_system_id

		# @return [WsLeadSource]
		attr_reader :lead_source
		
		# @return [WsSellingProcess]
		attr_reader :selling_process
		
		# @return [WsOpportunityStatus]
		attr_reader :opportunity_status
		
		# @return [WsOpportunityStatusReason]
		attr_reader :opportunity_status_reason
		
		# @return [Boolean]
		attr_reader :hot
		
		# @return [Date]
		attr_reader :created_on, :updated_on
		
	end
	
end