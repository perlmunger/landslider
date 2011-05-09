
class Landslider

	class WsAccount < WsEntity
		
		# @return [Integer]
		attr_reader :account_id, :account_owner, :archived_by, :create_by, :update_by, :parent_account_id
		
		# @return [String]
		attr_reader :account_name, :account_number, :division, :fax
		
		# @return [String]
		attr_reader :phone, :source_id, :url

		# @return [Date]
		attr_reader :created_on, :updated_on
		
		# @return [WsAccountType]
		attr_reader :account_type
		
		# @return [WsAddress]
		attr_reader :billing_address, :main_address, :shipping_address
		
		# @return [WsContact]
		attr_reader :primary_contact
		
		# @return WsAccountCustomField[]
		attr_reader :custom_fields
				
	end
	
end
