
class Landslider
	
	class WsSearch
		attr_writer :first_result_position, :total_results_requested, :updated_on
		attr_writer :search_criteria
	
		def initialize
		end

		# @param [Handsoap::XmlMason::Node] msg
		# @return [Handsoap::XmlMason::Node]
		def soapify_for(msg)
			msg.add 'firstResultPosition', @first_result_position || DEFAULT_FIRST_RESULT_POSITION
			msg.add 'totalResultsRequested', @total_results_requested || DEFAULT_TOTAL_RESULTS_REQUESTED
			msg.add 'updatedOn', @updated_on unless @updated_on.nil?
			unless @search_criteria.nil?
				@search_criteria.soapify_for(msg)
			end
		
		end

	end

end
