class Landslider

	class WsProductResult < WsResult
		
		# @return [WsProduct]
		attr_reader :product
		
		# @return [Boolean]
		attr_reader :is_created
	end
	
end