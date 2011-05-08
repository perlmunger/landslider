
class Landslider

	class WsPaymentTerm < WsEntity
		
		# @return [Integer]
		attr_reader :payment_term_id
		
		# @return [String]
		attr_reader :description
		
		# @return [Boolean]
		attr_reader :default_value
		
	end
	
end