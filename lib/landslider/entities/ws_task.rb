
class Landslider

	class WsTask < WsEntity
		
		# @return [Integer]
		attr_reader :task_id, :assigned_to, :created_by, :archived_by, :associated_contact_id, :associated_entity_id, :updated_by
		
		# Required
		# @return [String]
		attr_writer :task_name
		
		# @return [Boolean]
		attr_reader :completed
		
		# @param [Handsoap::XmlMason::Node] msg
		# @return [Handsoap::XmlMason::Node]
		def soapify_for(msg)
			super(msg)
			msg.add 'taskName', @task_name unless @task_name.nil?
			msg.add 'completed', @completed

		end
		
	end

end
