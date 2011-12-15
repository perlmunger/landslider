class Landslider

	class WsEntity
		
		# @return [Integer]
		attr_reader :entity_id
		
		# @return [String]
		attr_reader :entity_type, :entity_name
		
		def soapify_for(msg)
			msg.add 'entityId', @entity_id unless @entity_id.nil?
		end
	end
	
end

	