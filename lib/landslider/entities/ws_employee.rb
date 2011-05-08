
class Landslider

	class WsEmployee < WsEntity
		
		# @return [Integer]
		attr_reader :employee_id
		
		# @return [String]
		attr_reader :cell_phone, :company_name, :email_address, :fax

		# @return [String]
		attr_reader :first_name, :home_phone, :last_name, :office_phone
		
		# @return [String]
		attr_reader :title, :user_id
		
		# @return [Boolean]
		attr_reader :administrator
		
	end
	
end
