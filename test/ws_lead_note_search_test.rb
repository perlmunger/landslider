
require 'test_helper'

class WsLeadNoteSearchTest < Test::Unit::TestCase

	def setup
		$sid5 ||= Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)[:session_id]
	end
	
	def test_opportunity_note_search
		search = Landslider::WsLeadNoteSearch.new(33592028)
		result = Landslider.get_lead_notes($sid5, search)
		
		assert_equal false, result[:error]
		assert_equal 1, result[:results_returned]
	end

	
end