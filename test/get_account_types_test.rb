
require 'test_helper'

class GetAccountTypesTest < Test::Unit::TestCase

	def setup
		# Landslider.logger = $stdout
		$sesson_id ||= Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)[:session_id]
	end
	
	def test_get_account_types
		result = Landslider.get_account_types($sesson_id)

		assert_not_nil result
		assert_equal false, result[:error]
		assert_kind_of Array, result[:account_types]
	end
	
	
end