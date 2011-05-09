
class Landslider

	class WsProductFamily < WsEntity
		
		# @return [Integer]
		attr_reader :product_family_id, :parent_product_family_id
		
		# @return [String]
		attr_reader :product_family, :description, :parent_product_family
		
		# @return [Date]
		attr_reader :archived_on
		
	end
	
end
