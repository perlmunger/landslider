
require 'test_helper'

class WsOpportunityNoteSearchTest < Test::Unit::TestCase

	def setup
		$sid4 ||= Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)[:session_id]
	end
	
	def test_opportunity_note_search
		search = Landslider::WsOpportunityNoteSearch.new(55952453)
		result = Landslider.get_opportunity_notes($sid4, search)
		assert_equal false, result[:error]
		assert_equal 2, result[:results_returned]
	end
	
	def test_opportunity_note_search_limit_by_results_requested
		search = Landslider::WsOpportunityNoteSearch.new(55952453)
		search.total_results_requested = 1
		result = Landslider.get_opportunity_notes($sid4, search)
		assert_equal false, result[:error]
		assert_equal 1, result[:results_returned]
	end
	
end