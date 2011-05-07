class Landslider
	
	class WsLeadNoteSearch < WsSearch
		attr_reader :lead_id

		def initialize(lead_id)
			@lead_id = lead_id
		end

		# @param [Handsoap::XmlMason::Node] msg
		# @return [Handsoap::XmlMason::Node]
		def soapify_for(msg)
			msg.add('leadNote') { |crit|
				crit.add 'leadId', @lead_id
				super(crit)
			}
		end
		
	end
	
end
