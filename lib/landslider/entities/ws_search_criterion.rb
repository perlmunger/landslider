class Landslider
	
	class WsSearchCriterion
		attr_reader :field_id, :operator, :query_value

		def initialize(field_id, operator, query_value)
			@field_id = field_id
			@operator = operator
			@query_value = query_value
		end
	
		# @param [Handsoap::XmlMason::Node] msg
		# @return [Handsoap::XmlMason::Node]
		def soapify_for(msg)
			msg.add('searchCriteria') { |crit|
				crit.add 'fieldId', @field_id
				crit.add 'operator', @operator
				crit.add 'queryValue', @query_value unless @query_value.nil?
			}
		end
	end
	
end
