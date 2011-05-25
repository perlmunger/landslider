class Landslider
	
	class WsProduct < WsEntity
		
		# @return [Integer]
		attr_reader :product_id
		
		# @return [String]
		attr_reader :product_name, :source_id, :description_text, :product_code
		
		# @return [Integer]
		attr_reader :create_by, :update_by
		
		# @return [Date]
		attr_reader :created_on, :updated_on
		
		# @return [WsDurationType]
		attr_reader :duration_type
		
		# @return [WsProduct]
		attr_reader :parent_product
		
		# @return [WsProductFamily]
		attr_reader :product_family

		# @param [Handsoap::XmlMason::Node] msg
		# @return [Handsoap::XmlMason::Node]
		# @todo implementation
		def soapify_for(msg)
		end
		
	end
	
end


