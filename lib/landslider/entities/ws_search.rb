
class Landslider
	
	class WsSearch
		
		# Sets the starting index of records you want to retrieve. defaults to 1
		attr_writer :first_result_position
		
		# Sets the maximum number of records to retrieve. defaults to 25
		attr_writer :total_results_requested
		
		# Sets a Date to search records updated on or after
		attr_writer :updated_on
		
		# Sets the WsSearchCriterion for the search
		# only available for getAccounts, getOpportunities, getProductFamilies, and GetDurationTypes APIs
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
