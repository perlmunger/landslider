
class Landslider

	# private String city;
	# private String companyName;
	# private String email;
	# private String title;
	# private String firstName;
	# private String middleInitial;
	# private String lastName;
	# private String homePhone;
	# private String workPhone;
	# private String cellPhone;
	# private String otherPhone;
	# private String state;
	# private String postalCode;
	# private String country;	
	class WsContactSearch < WsSearch
		
		# @return [String]
		attr_reader :first_name, :last_name, :email
		
		# @param [Handsoap::XmlMason::Node] msg
		# @return [Handsoap::XmlMason::Node]
		def soapify_for(msg)
			msg.add('contactsRequest') { |crit|
				super(crit)
				crit.add 'firstName', @first_name unless @first_name.nil?
				crit.add 'lastName', @last_name unless @last_name.nil?
				crit.add 'email', @email unless @email.nil?
			}
		end
		
	end
	
end
s