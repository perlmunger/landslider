class Landslider
	
	class WsContactNoteSearch < WsSearch
		attr_reader :contact_id

		def initialize(contact_id)
			@contact_id = contact_id
		end

		# @param [Handsoap::XmlMason::Node] msg
		# @return [Handsoap::XmlMason::Node]
		def soapify_for(msg)
			msg.add('contactNote') { |crit|
				crit.add 'contactId', @contact_id
				super(crit)
			}
		end
	end
	
end
