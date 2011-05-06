
require 'test_helper'

class WsAccountNoteSearchTest < Test::Unit::TestCase

	def setup
		$sid3 ||= Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)[:session_id]
	end
	
	def test_account_note_search
		search = Landslider::WsAccountNoteSearch.new(55647822)
		result = Landslider.get_account_notes($sid3, search)
		assert_equal false, result[:error]
		assert_equal 7, result[:results_returned]
	end
	
	def test_account_note_search_limit_by_updated_on
		search = Landslider::WsAccountNoteSearch.new(55647822)
		search.updated_on = '2011-04-21'
		result = Landslider.get_account_notes($sid3, search)
		assert_equal false, result[:error]
		assert_equal 2, result[:results_returned]
	end
	
	def test_account_note_search_limit_by_results_requested
		search = Landslider::WsAccountNoteSearch.new(55647822)
		search.total_results_requested = 4
		result = Landslider.get_account_notes($sid3, search)
		assert_equal false, result[:error]
		assert_equal 4, result[:results_returned]
	end
	
end