
require 'test_helper'

class LandsliderTest < Test::Unit::TestCase

	def test_landslider_login
		result = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)
		
		assert_not_nil result
		assert_equal false, result[:error]
		assert_not_nil result[:session_id]
	end
	
	def test_landslider_get_api_version
		result = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)
		result = Landslider.get_api_version(result[:session_id])
		
		assert_not_nil result
		assert_operator result[:major_version], :>=, 2
		assert_operator result[:minor_version], :>=, 0
		assert_operator result[:revision_version], :>=, 0
	end
	
	def test_get_accounts
		result = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)
		result = Landslider.get_accounts(result[:session_id])
		assert_equal false, result[:error]
		assert_not_nil result[:accounts]
		assert result[:accounts].all? { |a| !a[:account_name].nil? }, "account name required"
		assert_operator result[:results_returned], :>=, 0
		assert_operator result[:total_results_available], :>=, 0
		assert_not_nil result[:result_msg]
	end
	

	private

	def login(session_id)
		Landslider.login(session_id)
	end
	

end

