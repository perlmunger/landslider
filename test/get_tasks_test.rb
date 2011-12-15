require 'test_helper'

require 'date'

class GetTasksTest < Test::Unit::TestCase

	def setup
		# uncomment this line to debug
		# Landslider.logger = $stdout
		$sesson_idt7 ||= Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)[:session_id]
	end
	
	def test_get_tasks_with_default_search
		search = Landslider::WsTaskSearch.new
		result = Landslider.get_tasks($sesson_idt7, search)
		assert_not_nil result
		assert_equal false, result[:error]
		assert_kind_of Array, result[:tasks]
		#assert_equal 25, result[:tasks].size
		
	end
	
	
	def test_add_task
		task = Landslider::WsTask.new
		dt = DateTime.strptime("2011-12-25T11:25:56-05:00")
		task.task_name='task for ' + dt.to_s
		task.due_date= dt
		result = Landslider.add_task($sesson_idt7, task)
		assert_not_nil result
		assert_equal false, result[:error]
		assert_equal true, result[:created]
	end
	
end