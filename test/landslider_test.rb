
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
	
	def test_landslider_get_accounts
		result = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)
		result = Landslider.get_accounts(result[:session_id])
		assert_equal false, result[:error]
		assert_not_nil result[:accounts]
		assert result[:accounts].all? { |a| !a[:account_name].nil? }, "account name required"
		assert_operator result[:results_returned], :>=, 0
		assert_operator result[:total_results_available], :>=, 0
		assert_not_nil result[:result_msg]
	end
	
	def test_landslider_get_account_contacts
		result = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)
		
		# exists on jaytest
		result = Landslider.get_account_contacts(result[:session_id], 51857822)		
		
		assert_equal false, result[:error]
		assert_operator result[:results_returned], :>=, 1
		assert result[:contacts].all? { |con| !con[:last_name].nil? }, "last name required"
	end
	
	def test_landslider_get_account_notes
		result = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)

		# exists on jaytest
		result = Landslider.get_account_notes(result[:session_id], 55647822)
		
		validate_standard_api_result result
		assert_operator result[:results_returned], :>=, 1

	end
	
	
	def test_landslider_get_account_opportunities
		result = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)

		# exists on jaytest
		result = Landslider.get_account_opportunities(result[:session_id], 51858821)
	  
		assert_equal false, result[:error]
		assert result[:opportunities].all? { |opp| 
			!opp[:account_name].nil? && 
			!opp[:name].nil? && 
			!opp[:deal_value].nil? && 
			!opp[:selling_process].nil?
		}, "opportunities require a name, account, deal value and selling process"
	end

	def test_landslider_get_contact_notes
		result = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)
		
		# exists on jaytest
		result = Landslider.get_contact_notes(result[:session_id], 62813411)
		
		validate_standard_api_result result
		assert_operator result[:results_returned], :>=, 1
	end
	
	def test_landslider_get_lead_notes
		result = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)
		
		# exists on jaytest
		result = Landslider.get_lead_notes(result[:session_id], 33592028)
		validate_standard_api_result result
		assert_operator result[:results_returned], :>=, 1
	
	end
	
	
	def test_landslider_get_opportunity_notes
		result = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)
		
		# exists on jaytest
		result = Landslider.get_opportunity_notes(result[:session_id], 55952453)
		validate_standard_api_result result
		assert_operator result[:results_returned], :>=, 1
	end

	
	

	private

	def validate_standard_api_result(result) 
		assert_equal Hash, result.class, "api method should return a hash"
		assert_operator result[:results_returned], :>=, 0
		assert_equal false, result[:error], "error should be false"
	end

	def login(session_id)
		Landslider.login(session_id)
	end
	

end

