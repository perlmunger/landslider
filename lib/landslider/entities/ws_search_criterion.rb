class Landslider
	
	class WsSearchCriterion
		
		attr_reader :field_id, :operator
		attr_reader :query_value

		
		# @param [String] field_id 
		# Currently Searchable Account Fields:
		# 	[AccountId, AccountName, AccountNumber, AccountShortName, AccountType, AccountTypeId, ArchivedOn, BillingAddressCity, BillingAddressCountry, BillingAddressState, BillingAddressStreet, BillingAddressZip, CreatedById, CreatedDate, Division, Fax, LastUpdatedById, LastUpdatedDate, MainAddressCity, MainAddressCountry, MainAddressState, MainAddressStreet, MainAddressZip, NewsKeywords, OwnerId, ParentAccount, ParentAccountId, Phone, PrimaryContactId, QuickbooksLastSynced, ShippingAddressCity, ShippingAddressCountry, ShippingAddressState, ShippingAddressStreet, ShippingAddressZip, SourceSystemId, SyncWithQuickBooks, Ticker, Url]
		# Currently Searchable Opportunity Fields:
		# 	[AccountId, AccountName, ArchivedOn, ClosedDate, ComputedConfidence, ComputedForecastDate, CreatedById, CreatedDate, CurrentPhaseId, CurrentPhaseName, DealValue, Description, IsHot, LastUpdatedById, LastUpdatedDate, LeadSource, LeadSourceId, Name, OpportunityId, OverriddenConfidence, OverriddenForecastDate, OverrideComments, OwnerId, PaymentTerms, PaymentTermsId, QuickbooksLastSynced, QuickbooksTransactionType, SellingProcess, SellingProcessId, SourceSystemId, StartDate, Status, StatusId, StatusReason, StatusReasonId, SuspendedDate]
		# Currently Searchable Duration Type Fields:
		# 	[DurationType, DurationTypeId]
		# Currently Searchable Product Family Fields:
		# 	[Description, ParentProductFamily, ParentProductFamilyId, ProductFamily, ProductFamilyId]
		# @param [String, WsSearchOperator] operator Contains,SoundsLike,Equals,NotEquals,LessThan,LessThanOrEqual,GreaterThan,GreaterThanOrEqual,Empty,NotEmpty,True,False,In,NotIn
		# @param [String, WsSearchOperator] query_value string to search for
		def initialize(field_id, operator, query_value)
			@field_id = field_id
			@operator = operator
			@query_value = query_value
		end
	
		# Adds the search criteria xml
		# @param [Handsoap::XmlMason::Node] msg xml node
		# @return [Handsoap::XmlMason::Node]
		def soapify_for(msg)
			msg.add('searchCriteria') { |crit|
				crit.add 'fieldId', @field_id
				crit.add 'operator', @operator
				crit.add 'queryValue', @query_value unless @query_value.nil?
			}
		end
	end
	
end
