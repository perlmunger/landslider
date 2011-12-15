
class Landslider

	# search criteria for getTasks
	class WsTaskSearch < WsSearch
		
		# @return [Integer]
		attr_writer :assigned_to, :created_by, :task_type_id, :associated_entity_id, :associated_contact_id

		# @return [Date]
		attr_writer :updated_on
		
		# @param [Handsoap::XmlMason::Node] msg
		# @return [Handsoap::XmlMason::Node]
		def soapify_for(msg)
			super(msg)
			msg.add 'assignedTo', @assigned_to unless @assigned_to.nil?
			msg.add 'createdBy', @created_by unless @created_by.nil?
			msg.add 'taskTypeId', @task_type_id unless @task_type_id.nil?
			msg.add 'associatedContactId', @associated_contact_id unless @associated_contact_id.nil?
			msg.add 'associatedEntityId', @associated_entity_id unless @associated_entity_id.nil?
		end
		
	end
	
end