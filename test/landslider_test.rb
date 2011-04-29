
require 'test_helper'

class LandsliderTest < Test::Unit::TestCase

	JAYTEST_ACCOUNT_ID = 55647822
	
	def setup
		# TODO: fetch a session_id once
		# if $sid.nil?
			result = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)
			$sid = result[:session_id]
		# end
		#puts "using #{$sid} to login"
	end

	def test_landslider_login
		# other tests should use $sid for authenticatoin
		result = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)
		
		assert_not_nil result
		assert_equal false, result[:error]
		assert_not_nil result[:session_id]
	end
	
	def test_landslider_get_api_version
		result = Landslider.get_api_version($sid)
		
		assert_not_nil result
		assert_operator result[:major_version], :>=, 2
		assert_operator result[:minor_version], :>=, 0
		assert_operator result[:revision_version], :>=, 0
	end
	
	def test_landslider_get_accounts
		result = Landslider.get_accounts($sid)

		assert_equal false, result[:error]
		assert_not_nil result[:accounts]
		assert result[:accounts].all? { |a| !a[:account_name].nil? }, "account name required"
		assert_operator result[:results_returned], :>=, 0
		assert_operator result[:total_results_available], :>=, 0
		assert_not_nil result[:result_msg]
	end
	
	def test_landslider_get_account_by_id
		result = Landslider.get_account_by_id($sid, JAYTEST_ACCOUNT_ID)
		
		assert_not_nil result
		assert_equal false, result[:error]
		assert_not_nil result[:account]
		assert_not_nil result[:account][:fax]
		
	end
	
	def test_landslider_account_custom_fields
		result = Landslider.get_account_by_id($sid, JAYTEST_ACCOUNT_ID)
		
		assert_not_nil result
		assert_equal false, result[:error]
		assert_not_nil result[:account]
		
		assert_not_nil result[:account][:custom_fields]
		assert_equal Array, result[:account][:custom_fields].class
		assert_operator result[:account][:custom_fields].length, :>=, 2
		
	end
	
	def test_landslider_get_account_contacts
		# exists on jaytest
		result = Landslider.get_account_contacts($sid, 51857822)
		
		validate_standard_api_result result
		assert_equal Array, result[:contacts].class
		assert_not_nil result[:contacts].first[:contact_id]
		assert result[:contacts].all? { |con| !con[:last_name].nil? }, "last name required"
	end
	
	def test_landslider_get_account_notes
		result = Landslider.get_account_notes($sid, JAYTEST_ACCOUNT_ID)
		
		validate_standard_api_result result
		validate_at_least_one_note_returned result
	end
	
	def test_landslider_get_account_opportunities
		# exists on jaytest
		result = Landslider.get_account_opportunities($sid, 51858821)

		assert_equal false, result[:error]
		assert_equal Array, result[:opportunities].class
		
		assert result[:opportunities].all? { |opp| 
			!opp[:account_name].nil? && 
			!opp[:name].nil? && 
			!opp[:deal_value].nil? && 
			!opp[:selling_process].nil?
		}, "opportunities require a name, account, deal value and selling process"
	end
	
	def test_landslider_get_contact_notes
		# exists on jaytest
		result = Landslider.get_contact_notes($sid, 62813411)
		
		validate_standard_api_result result
		validate_at_least_one_note_returned result
	end
	
	def test_landslider_get_instance_information
		# Landslide API doc bug..  integer user_id doesn't work
		result = Landslider.get_instance_information($sid, 'jayp@landslide.com')
		
		assert_not_nil result
		assert_equal false, result[:error]
		assert_not_nil result[:address]
		assert_not_nil result[:company_name]
		assert_not_nil result[:instance_url]
	end
	
	def test_landslider_get_leads
		result = Landslider.get_leads($sid, 51857822)
		
		validate_standard_api_result result
		assert_not_nil result[:leads]
		assert_equal Array, result[:leads].class
	end
	
	
	def test_landslider_get_lead_notes
		# exists on jaytest
		result = Landslider.get_lead_notes($sid, 33592028)
		
		validate_standard_api_result result
		validate_at_least_one_note_returned result
	end
	
	
	def test_landslider_get_opportunity_notes
		# exists on jaytest
		result = Landslider.get_opportunity_notes($sid, 55952453)
		
		validate_standard_api_result result
		validate_at_least_one_note_returned result
	end
	
	def test_landslider_get_user_information
		result = Landslider.get_user_information($sid, 'jayp@landslide.com')
		
		assert_not_nil result
		assert_equal false, result[:error]
		assert_not_nil result[:employee]
		assert_not_nil result[:employee][:user_id]
	end
	
	def test_landslider_get_user_information_by_id
	
		result = Landslider.get_user_information_by_id($sid, 12640894)
		
		assert_not_nil result
		assert_equal false, result[:error]
		assert_not_nil result[:employee]
		assert_not_nil result[:employee][:user_id]
	end
	
	private
	
	def validate_standard_api_result(result) 
		assert_equal Hash, result.class, "api method should return a hash"
		assert_not_nil result[:results_returned], ":results_returned missing"
		assert_operator result[:results_returned], :>=, 0
		assert_not_nil result[:total_results_available], ":total_results_available missing"
		assert_operator result[:total_results_available], :>=, 0
		assert_not_nil result[:error]
		assert_equal false, result[:error], "error should be false"
	end
	
	def validate_at_least_one_note_returned(result)
		assert_operator result[:results_returned], :>=, 1
		assert_not_nil result[:notes], "at least one note should be returned"
		assert_equal Array, result[:notes].class
	end

end

