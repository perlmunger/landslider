
require 'test_helper'

class WsContactNoteSearchTest < Test::Unit::TestCase

	def setup
		$sid4 ||= Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)[:session_id]
	end
	
	def test_contact_note_search
		search = Landslider::WsContactNoteSearch.new(62813411)
		result = Landslider.get_contact_notes($sid4, search)

		assert_equal false, result[:error]
		assert_equal 2, result[:results_returned]
	end
	
	def test_contact_note_search_limit_by_results_requested
		search = Landslider::WsContactNoteSearch.new(62813411)
		search.total_results_requested = 1
		result = Landslider.get_contact_notes($sid4, search)
		
		assert_equal false, result[:error]
		assert_equal 1, result[:results_returned]
	end
	
end