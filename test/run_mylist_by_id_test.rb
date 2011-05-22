
require 'test_helper'

class RunMylistByIdTest < Test::Unit::TestCase

	# this test depends on data in the jaytest instance
	JAYTEST_MYLIST_ID = 10293817

	def setup
		$sid7 ||= Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)[:session_id]
	end
	
	def test_landslider_run_mylist_by_id
		
		result = Landslider.run_mylist_by_id($sid7, JAYTEST_MYLIST_ID)
		assert_equal false, result[:error]
		
		assert_operator result[:results_returned], :>=, 0
		assert_kind_of Array, result[:results]
	end
	
end