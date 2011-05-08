class Landslider
	class WsContact < WsEntity
		
		# @return [Integer]
		attr_reader :contact_id, :owner_id, :create_by, :update_by, :archived_by
		
		# @return [String]
		attr_reader :namae, :account_name, :description, :source_system_id

		# @return [Date]
		attr_reader :archived_on, :created_on, :updated_on
		
		# @return [Boolean]
		attr_reader :buyer
		
		# @return [String]
		attr_reader :cell_phone, :comments, :company_name

		# @return [String]
		attr_reader :department, :email, :fax, :first_name

		# @return [String]
		attr_reader :home_phone, :last_name, :middle_initials, :suffix

		# @return [String]
		attr_reader :source_system_id

		# @return [WsContactType]
		attr_reader :contact_type
		
		# @return [WsAddress]
		attr_reader :work_address
	
		# @return [WsAccountContact]
		attr_reader :account_contact
		
	end
end