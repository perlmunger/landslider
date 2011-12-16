
class Landslider

	class WsTask < WsEntity
		
		# @return [Integer]
		attr_reader :task_id, :created_by, :archived_by, :associated_contact_id, :associated_entity_id, :updated_by
		
		# The name of the task (required)
		# @return [String]
		attr_writer :task_name
		
		# The due date for the task
		# @return [Date]
		attr_writer :due_date
		
		# The unique Landslide Id of the user who the task is assigned to
		# @return [Integer]
		attr_writer :assigned_to

		# The unique Landslide Id of the task type associated to the task
		# @return [Integer]
		attr_writer :task_type_id
		
		# @return [Boolean]
		attr_reader :completed
		
		# @param [Handsoap::XmlMason::Node] msg
		# @return [Handsoap::XmlMason::Node]
		def soapify_for(msg)
			super(msg)
			msg.add 'taskName', @task_name unless @task_name.nil?
			msg.add 'dueDate', @due_date unless @due_date.nil?
			msg.add 'assignedTo', @assigned_to.to_i unless @assigned_to.nil?
			msg.add 'taskTypeId', @task_type_id.to_i unless @task_type_id.nil?
			msg.add 'completed', @completed

		end
		
	end

end
