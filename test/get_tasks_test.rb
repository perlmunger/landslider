require 'test_helper'

class GetTasksTest < Test::Unit::TestCase

	def setup
		# uncomment this line to debug
		# Landslider.logger = $stdout
		$sesson_idt7 ||= Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)[:session_id]
	end
	
	def test_get_accounts_without_search
		search = Landslider::WsTaskSearch.new
		result = Landslider.get_tasks($sesson_idt7, search)

		puts result.inspect

		assert_not_nil result
		assert_equal false, result[:error]
		assert_kind_of Array, result[:tasks]
		assert_equal 18, result[:tasks].size
		
	end
	
end