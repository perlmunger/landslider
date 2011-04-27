
require 'handsoap'

class Landslider < Handsoap::Service

	endpoint ::LS_API_ENDPOINT

	def session_id
		@session_id
	end

	def session_id=(session_id)
		@session_id = session_id
	end

	def on_create_document(doc)
		doc.alias 'urn', ::LS_API_NAMESPACE
		header = doc.find('Header')
		header.add('urn:SessionHeader') { |sh|
			sh.add('urn:sessionId', self.session_id)
		}
	end

	def on_http_error(response)
		puts response.inspect
	end

	def login(session_id)
		self.session_id = session_id
		
		response = invoke("login", :soap_action => :none) do |message|
			message.add('wsUser') { |u|
				u.add 'username', ::LS_API_USERNAME 
				u.add 'password', ::LS_API_KEY
			}
		end
		
		node = response.document.xpath('//ns:loginResponse/loginResponse', ns)
		parse_login_result(node)
	end
	
	def get_api_version(session_id)
		self.session_id = session_id
		
		response = invoke("getApiVersion", :soap_action => :none)
		
		node = response.document.xpath('//ns:getApiVersionResponse', ns)
		parse_api_version_result(node)
	end
	
	def get_accounts(session_id)
		self.session_id = session_id
		response = invoke("getAccounts", :soap_action => :none) do |message|
			message.add('accountsRequest') { |ar|
				ar.add 'firstResultPosition', 1
				ar.add 'totalResultsRequested', 10
				ar.add('searchCriteria') { |sc|
					# just find accounts with an empty main city
					
					sc.add 'fieldId', 'MainAddressCity'
					sc.add 'operator', 'Empty'
				}
			}
		end
		
		node = response.document.xpath('//ns:getAccountsResponse', ns)
		parse_get_accounts_result(node)
	end
	
	def get_account_by_id(session_id, account_id)
		self.session_id = session_id
		
		response = invoke("getAccountById", :soap_action => :none) do |message|
			message.add 'accountId', account_id
		end
		
		node = response.document.xpath('//ns:getAccountByIdResponse', ns)
		parse_get_account_by_id_result(node)
	end

	def get_account_contacts(session_id, account_id)
		self.session_id = session_id
		response = invoke("getAccountContacts", :soap_action => :none) do |message|
			message.add 'accountId', account_id
		end
		
		node = response.document.xpath('//ns:getAccountContactsResponse', ns)
		parse_get_account_contacts_result(node) 
	end
		
	def get_account_notes(session_id, account_id)
		self.session_id = session_id

		response = invoke("getAccountNotes", :soap_action => :none) do |message|
			message.add('accountNoteSearch') { |ans|
		
				ans.add 'accountId', account_id
				ans.add 'firstResultPosition', 1
				ans.add 'totalResultsRequested', 10
				
				ans.add('searchCriteria') { |sc|
					# just find accounts with an empty main city
					
					sc.add 'fieldId', 'MainAddressCity'
					sc.add 'operator', 'Empty'
				}
			}
		end
		node = response.document.xpath('//ns:getAccountNotesResponse', ns)
		parse_get_account_notes_result(node)
	end
	
	def get_account_opportunities(session_id, account_id)
		self.session_id = session_id
		response = invoke("getAccountOpportunities", :soap_action => :none) do |message|
			message.add 'accountId', account_id
		end
		
		node = response.document.xpath('//ns:getAccountOpportunitiesResponse', ns)
		parse_get_account_opportunities_result(node)	
	end

	def get_contact_notes(session_id, contact_id)
		self.session_id = session_id
		
		response = invoke("getContactNotes", :soap_action => :none) do |message|
			message.add('contactNote') { |ans|
				ans.add 'contactId', contact_id
				ans.add 'firstResultPosition', 1
				ans.add 'totalResultsRequested', 10
			}
		end
		node = response.document.xpath('//ns:getContactNotesResponse', ns)
		parse_get_contact_notes_result(node)
	end
	
	def get_opportunity_notes(session_id, opportunity_id)
		self.session_id = session_id
	
		response = invoke("getOpportunityNotes", :soap_action => :none) do |message|
			message.add('opportunityNote') { |ans|
		
				ans.add 'opportunityId', opportunity_id
				ans.add 'firstResultPosition', 1
				ans.add 'totalResultsRequested', 10
			}
		end
		node = response.document.xpath('//ns:getOpportunityNotesResponse', ns)
		parse_get_opportunity_notes_result(node)
	end
	
	def get_leads(session_id, account_id)
		self.session_id = session_id
	
		response = invoke("getLeads", :soap_action => :none) do |message|
			message.add('leadRequest') { |lr|
		
				lr.add 'firstResultPosition', 1
				lr.add 'totalResultsRequested', 10
			}
		end
		node = response.document.xpath('//ns:getLeadsResponse', ns)
		parse_get_leads_result(node)
	end
	
	def get_lead_notes(session_id, lead_id)
		self.session_id = session_id
	
		response = invoke("getLeadNotes", :soap_action => :none) do |message|
			message.add('leadNote') { |ans|
		
				ans.add 'leadId', lead_id
				ans.add 'firstResultPosition', 1
				ans.add 'totalResultsRequested', 10
			}
		end
		node = response.document.xpath('//ns:getLeadNotesResponse', ns)
		parse_get_lead_notes_result(node)
	end
	
	private

	def ns
		{ 'ns' => LS_API_NAMESPACE }
	end

	def parse_login_result(node)
		{
		:error => xml_to_bool(node, './error/text()'),	
		:error_code => xml_to_int(node, './errorCode/text()'),
		:result_msg => xml_to_str(node, './resultMsg/text()'),
		:status_code => xml_to_int(node, './statusCode/text()'),
		:password_expired => xml_to_bool(node, './passwordExpired/text()'),
		:session_id => xml_to_str(node, './sessionId/text()')
		}
	end
	
	def parse_api_version_result(node)
		{
		:internal_name => xml_to_str(node, '//ApiVersion/internalName/text()'),
		:label => xml_to_str(node, '//ApiVersion/label/text()'),
		:major_version => xml_to_int(node, '//ApiVersion/majorVersion/text()'),
		:minor_version => xml_to_int(node, '//ApiVersion/minorVersion/text()'),
		:revision_version => xml_to_int(node, '//ApiVersion/revisionVersion/text()')
		}
	end

	def parse_get_accounts_result(node)
		{
		:accounts => node.xpath('//Accounts/accountList', ns).map { |child| parse_account(child) },
		
		:error => xml_to_bool(node, '//Accounts/error/text()'),
		:error_code => xml_to_int(node, '//Accounts/errorCode/text()'),
		:result_msg => xml_to_str(node, '//Accounts/resultMsg/text()'),
		:results_returned => xml_to_int(node, '//Accounts/resultsReturned/text()'),
		:total_results_available => xml_to_int(node, '//Accounts/totalResultsAvailable/text()')
		}
	end
	
	def parse_get_account_by_id_result(node)
		{
		:account => parse_account(node.xpath('./Account/account')),
		:error => xml_to_bool(node, './*/error/text()'),
		:error_code => xml_to_int(node, './*/errorCode/text()'),
		:result_msg => xml_to_str(node, './*/resultMsg/text()')
		}	
	end
	
	def parse_get_account_notes_result(node) 
		{
		:notes => parse_notes(node),
		
		:error => xml_to_bool(node, './*/error/text()'),
		:error_code => xml_to_int(node, './*/errorCode/text()'),
		:result_msg => xml_to_str(node, './*/resultMsg/text()'),
		:status_code => xml_to_int(node, './*/statusCode/text()'),
		:results_returned => xml_to_int(node, './*/resultsReturned/text()'),
		:total_results_available => xml_to_int(node, './*/totalResultsAvailable/text()')
		}
	end
	
	def parse_get_account_opportunities_result(node)
		{
		:opportunities => node.xpath('./*/opportunityList', ns).map { |child| parse_opportunity(child) },
		
		:error => xml_to_bool(node, './*/error/text()'),
		:results_returned => xml_to_int(node, './*/resultsReturned/text()'),
		:total_results_available => xml_to_int(node, './*/totalResultsAvailable/text()')
		}
	end

	def parse_get_account_contacts_result(node)
		{
		:contacts => node.xpath('./*/contactList', ns).map { |child| parse_contact(child) },
		
		:error => xml_to_bool(node, './*/error/text()'),
		:results_returned => xml_to_int(node, './*/resultsReturned/text()'),
		:total_results_available => xml_to_int(node, './*/totalResultsAvailable/text()')
		}
	end
	
	def parse_get_contact_notes_result(node)
		{
		:notes => parse_notes(node),
			
		:error => xml_to_bool(node, './*/error/text()'),
		:error_code => xml_to_int(node, './*/errorCode/text()'),
		:result_msg => xml_to_str(node, './*/resultMsg/text()'),
		:status_code => xml_to_int(node, './*/statusCode/text()'),
		:results_returned => xml_to_int(node, './*/resultsReturned/text()'),
		:total_results_available => xml_to_int(node, './*/totalResultsAvailable/text()')
		
		}
	end
	def parse_get_leads_result(node)
		{
		:leads => parse_leads(node),
		
		:error => xml_to_bool(node, './*/error/text()'),
		:error_code => xml_to_int(node, './*/errorCode/text()'),
		:result_msg => xml_to_str(node, './*/resultMsg/text()'),
		:status_code => xml_to_int(node, './*/statusCode/text()'),
		:results_returned => xml_to_int(node, './*/resultsReturned/text()'),
		:total_results_available => xml_to_int(node, './*/totalResultsAvailable/text()')
		}
	end
	
	def parse_get_lead_notes_result(node)
		{
		:notes => parse_notes(node),
		
		:error => xml_to_bool(node, './*/error/text()'),
		:error_code => xml_to_int(node, './*/errorCode/text()'),
		:result_msg => xml_to_str(node, './*/resultMsg/text()'),
		:status_code => xml_to_int(node, './*/statusCode/text()'),
		:results_returned => xml_to_int(node, './*/resultsReturned/text()'),
		:total_results_available => xml_to_int(node, './*/totalResultsAvailable/text()')
		}
	end
	
	def parse_get_opportunity_notes_result(node)
		{
		:notes => parse_notes(node),
			
		:error => xml_to_bool(node, './*/error/text()'),
		:error_code => xml_to_int(node, './*/errorCode/text()'),
		:result_msg => xml_to_str(node, './*/resultMsg/text()'),
		:status_code => xml_to_int(node, './*/statusCode/text()'),
		:results_returned => xml_to_int(node, './*/resultsReturned/text()'),
		:total_results_available => xml_to_int(node, './*/totalResultsAvailable/text()')
		}
	end
	
	# WsAccount
	def parse_account(node)
		{
		:entity_id => xml_to_str(node, './entityId/text()'),
		:entity_type => xml_to_str(node, './entityType/text()'),
		:parent_account_id => xml_to_str(node, './parentAccountId/text()'),
		:account_id => xml_to_str(node, './accountId/text()'),
		:account_name => xml_to_str(node, './accountName/text()'),
		:account_owner => xml_to_str(node, './accountOwner/text()'),
		:url => xml_to_str(node, './url/text()'),
		:phone => xml_to_str(node, './phone/text()'),
		:main_address => parse_address(node.xpath('./mainAddress')),
		:shipping_address => parse_address(node.xpath('./shippingAddress')),
		:billing_address => parse_address(node.xpath('./billingAddress')),
		:updated_by => xml_to_int(node, './updatedBy/text()'),
		:updated_on => xml_to_str(node, './updatedOn/text()'),
		:created_by => xml_to_int(node, './createdBy/text()'),
		:created_on => xml_to_str(node, './createdOn/text()'),
		:archived_by => xml_to_str(node, './archivedBy/text()'),
		:sync_with_quickbooks => xml_to_str(node, './isSyncWithQuickbooks/text()')
		}
		
	end
	
	# WsAccountType
	def parse_account_type(node)
		{
		#:entity_id => xml_to_str(node, './entityId/text()'),
		#:entity_type => xml_to_str(node, './entityType/text()')
		#:account_type_id => xml_to_str(node, './accountTypeId/text()'),
		:account_type => xml_to_str(node, './accountType/text()')
		}
	end
	
	# WsAddress 
	def parse_address(node)
		{
		#:entity_id => xml_to_str(node, './entityId/text()'),
		#:entity_type => xml_to_str(node, './entityType/text()'),
		#:address_id => xml_to_str(node, './addressId/text()'),
		:address => xml_to_str(node, './address1/text()'),
		:city => xml_to_str(node, './city/text()'),
		:state => xml_to_str(node, './state/text()'),
		:zip => xml_to_str(node, './zipPostal/text()'),
		:country => xml_to_str(node, './country/text()')
		}
	end
	
	# WsContact
	def parse_contact(node)
		{
		:first_name => xml_to_str(node, './firstName/text()'),
		:middle_initials => xml_to_str(node, './middleInitials/text()'),
		:last_name => xml_to_str(node, './lastName/text()'),
		:cell_phone => xml_to_str(node, './cellPhone/text()'),
		:work_phone => xml_to_str(node, './workPhone/text()'),
		:home_phone => xml_to_str(node, './homePhone/text()'),
		:email => xml_to_str(node, './email/text()'),
		:owner_id => xml_to_str(node, './ownerId/text()')
		}
	end
	
	def parse_notes(node)
		{
		:notes => node.xpath('./*/notes', ns).map { |child| parse_note(child) }
		}
	end
	
	# WsNote
	def parse_note(node)
		{
		#:entity_id => xml_to_str(node, './entityId/text()'),
		#:entity_type => xml_to_str(node, './entityType/text()'),
		:archived_by => xml_to_int(node, './archivedBy/text()'),
		:created_by => xml_to_int(node, './createdBy/text()'),
		:created_on => xml_to_date(node, './createdOn/text()'),
		:latest => xml_to_bool(node, './latest/text()'),
		:note_id => xml_to_int(node, './noteId/text()'),
		:note_html => xml_to_str(node, './note/text()')
		
		}
	end
	
	def parse_leads(node)
		{
		:leads => node.xpath('./*/leadList', ns).map { |child| parse_lead(child) }
		}
	end
	
	# WsLead
	def parse_lead(node)
		{
		:name => xml_to_str(node, './name/text()'),
		:ok_to_call => xml_to_bool(node, './okToCall/text()'),
		:ok_to_email => xml_to_bool(node, './okToEmail/text()'),
		:hot => xml_to_bool(node, './hot/text()')
		}
	
	end
	
	# WsOpportunity
	def parse_opportunity(node)
		{
		#:entity_id => xml_to_str(node, './entityId/text()'),
		#:entity_type => xml_to_str(node, './entityType/text()'),
		:account_id => xml_to_int(node, './accountId/text()'),
		:account_name => xml_to_str(node, './accountName/text()'),
		:opportunity_id => xml_to_int(node, './opportunityId/text()'),
		:name => xml_to_str(node, './name/text()'),
		:deal_value => xml_to_str(node, './dealValue/text()'),
		:confidence => xml_to_str(node, './confidence/text()'),
		:opportunity_status => xml_to_str(node, './opportunityStatus/status/text()'),
		:selling_process => xml_to_str(node, './sellingProcess/sellingProcess/text()'),
		:selling_process_id => xml_to_int(node, './sellingProcess/sellingProcessId/text()'),
		:primary_owner_id => xml_to_int(node, './primaryOwnerId/text()'),
		:current_phase_name => xml_to_str(node, './currentPhaseName/text()')
		}
	end

end


