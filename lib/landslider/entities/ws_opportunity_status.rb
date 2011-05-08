
class Landslider

	class WsOpportunityStatus < WsEntity
		
		# @return [Integer]
		attr_reader :opportunity_status_id

		# @return [String]
		attr_reader :opportunity_status
				
		# @return [WsOpportunityStatus]
		attr_reader :parent_opportunity_status

	end
	
end
