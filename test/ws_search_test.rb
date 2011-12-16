
require 'test_helper'

class WsSearchTest < Test::Unit::TestCase

	def setup
		# Landslider.logger = $stdout
		$sid2 ||= Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)[:session_id]
	end
	
	def test_ws_search_object
		search_criteria = Landslider::WsSearchCriterion.new('AccountName', 'Equals', 'Boston')
		assert_equal 'AccountName', search_criteria.field_id
		assert_equal 'Equals', search_criteria.operator
		assert_equal 'Boston', search_criteria.query_value
	end

	def test_get_accounts_without_search_criteria
		result = Landslider.get_accounts($sid2)

		assert_equal false, result[:error]
	end

	def test_get_accounts_with_search_criteria
		search = Landslider::WsSearch.new
		search.search_criteria = Landslider::WsSearchCriterion.new('AccountName', 'Equals', 'Boston')
		result = Landslider.get_accounts($sid2, search)
		
		assert_equal false, result[:error]
		assert_equal 1, result[:results_returned]
	end
	
	def test_get_accounts_with_more_than_one_search_criteria
		search = Landslider::WsSearch.new
		search.search_criteria = [Landslider::WsSearchCriterion.new('AccountName', 'Equals', "Jay's master account"),
			Landslider::WsSearchCriterion.new('AccountTypeId', 'Equals', '1539484')]

		result = Landslider.get_accounts($sid2, search)
		
		assert_equal false, result[:error]
		assert_equal 1, result[:results_returned]
	end

	def test_get_opportunities_without_search_criteria
		result = Landslider.get_opportunities($sid2)
	
		assert_equal false, result[:error]
	end
	
	def test_get_opportunities_with_search_criteria
		target_phase_name = 'Prospect'
		search = Landslider::WsSearch.new
		search.search_criteria = Landslider::WsSearchCriterion.new('CurrentPhaseName', 'Contains', target_phase_name)
		result = Landslider.get_opportunities($sid2, search)
		
		assert_equal false, result[:error]
		assert_equal target_phase_name, result[:opportunities][0][:current_phase_name]
		assert_equal target_phase_name, result[:opportunities][1][:current_phase_name]
		assert_equal target_phase_name, result[:opportunities][2][:current_phase_name]
	end

	def test_ws_search_initialized_with_attrs
		search = Landslider::WsSearch.new
		search.first_result_position = 2
		search.total_results_requested = 4
		assert_equal 2, search.instance_variable_get(:@first_result_position)
		assert_equal 4, search.instance_variable_get(:@total_results_requested)
	end

	def test_ws_search_initialized_with_params
		search = Landslider::WsSearch.new({:first_result_position => 25, :total_results_requested => 50})
		assert_equal 25, search.instance_variable_get(:@first_result_position)
		assert_equal 50, search.instance_variable_get(:@total_results_requested)
	end
	
end
