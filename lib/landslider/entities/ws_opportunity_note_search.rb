class Landslider
	
	class WsOpportunityNoteSearch < WsSearch
		attr_reader :opportunity_id

		def initialize(opportunity_id)
			@opportunity_id = opportunity_id
		end

		# @param [Handsoap::XmlMason::Node] msg
		# @return [Handsoap::XmlMason::Node]
		def soapify_for(msg)
			msg.add('opportunityNote') { |crit|
				crit.add 'opportunityId', @opportunity_id
				super(crit)
			}
		end
	end
	
end