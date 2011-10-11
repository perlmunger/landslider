
require 'test_helper'

class WsAccountContactSearchTest < Test::Unit::TestCase

	def setup
		Landslider.logger = $stdout
		$sess4 ||= Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)[:session_id]
	end
	
	def test_ws_account_contact_search
		search = Landslider::WsAccountContactSearch.new(55647822)
		
		result = Landslider.get_account_contacts($sess4, search)

		assert_equal false, result[:error]
		# assert_equal 2, result[:results_returned]
	end
	
	# def test_contact_note_search_limit_by_results_requested
	# 	search = Landslider::WsContactNoteSearch.new(62813411)
	# 	search.total_results_requested = 1
	# 	result = Landslider.get_contact_notes($sid4, search)
	# 	
	# 	assert_equal false, result[:error]
	# 	assert_equal 1, result[:results_returned]
	# end
	
end