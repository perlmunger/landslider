
class Landslider
	
	class WsSearch
		
		# @param [Integer] value num
		# Sets the starting index of records you want to retrieve. defaults to 1
		attr_writer :first_result_position
		
		# @param [Integer] value num
		# Sets the maximum number of records to retrieve. defaults to 25
		attr_writer :total_results_requested
		
		# @param [String] value date
		# Sets a Date to search records updated on or after
		attr_writer :updated_on
		
		# @param [WsSearchCriterion] value 
		# WsSearchCriterion is only documented to work with these APIs
		# * getAccounts
		# * getOpportunities
		# * getProductFamilies
		# * GetDurationTypes
		attr_writer :search_criteria
	
		# Create a new search obj
		def initialize
		end

		# Adds the search xml
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
