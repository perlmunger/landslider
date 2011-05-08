
class Landslider

	class WsAddress < WsEntity
		
		# @return [Integer]
		attr_reader :address_id
		
		# @return [String]
		attr_reader :address1, :address2, :address3, :addressNode, :city

		# @return [String]
		attr_reader :country, :state, :zip_postal

	end
	
end