
require 'test_helper'

class GetContactTest < Test::Unit::TestCase

	def setup
		$ss ||= Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)[:session_id]
	end

	def test_get_contact_by_id
		result = Landslider.get_contact_by_id($ss, 62813411)
		assert_equal false, result[:error]
	end

end	