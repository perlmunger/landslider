require 'test_helper'

require 'date'

class GetTasksTest < Test::Unit::TestCase

	def setup
		# uncomment this line to debug
		#Landslider.logger = $stdout
		$sesson_idt7 ||= Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)[:session_id]
	end
	
	def test_get_tasks_with_default_search
		search = Landslider::WsTaskSearch.new
		result = Landslider.get_tasks($sesson_idt7, search)
		assert_not_nil result
		assert_equal false, result[:error]
		assert_kind_of Array, result[:tasks]
	end
	
	
	def test_add_task
		
		user_info_result = Landslider.get_user_information($sesson_idt7, LS_API_USERNAME)
		task_types_result = Landslider.get_task_types($sesson_idt7)

		# TODO: come up with a better way for constructing objects
		task = Landslider::WsTask.new
		dt = DateTime.strptime("2011-12-25T11:25:56-05:00")
		task.task_name='task for ' + dt.to_s
		task.due_date= dt
		task.assigned_to = user_info_result[:employee][:employee_id]
		task.task_type_id = task_types_result[:task_types].first[:task_type_id]

		result = Landslider.add_task($sesson_idt7, task)
		assert_not_nil result
		assert_equal false, result[:error]
		assert_equal true, result[:created]
	end
	
	def test_get_task_types
		result = Landslider.get_task_types($sesson_idt7)
		assert_equal false, result[:error]
		assert_kind_of Array, result[:task_types]
	end
end