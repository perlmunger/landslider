
class Landslider

	# search criteria for getContacts
	class WsContactSearch < WsSearch
		
		# @return [String]
		attr_reader :city, :company_name, :email, :title, :first_name
		
		# @return [String]
		attr_reader :middle_initial, :last_name, :home_phone, :work_phone, :cell_phone
		
		# @return [String]
		attr_reader :other_phone, :state, :postal_code, :country
		
		# @param [Handsoap::XmlMason::Node] msg
		# @return [Handsoap::XmlMason::Node]
		def soapify_for(msg)
			msg.add('contactsRequest') { |crit|
				super(crit)
				crit.add 'firstName', @first_name unless @first_name.nil?
				crit.add 'lastName', @last_name unless @last_name.nil?
				crit.add 'email', @email unless @email.nil?
				crit.add 'state', @state unless @state.nil?
			}
		end
		
	end
	
end
s