class Landslider
	
	class WsSearchCriterion
		
		# Currently Searchable Account Fields:
		# 
		# 	[AccountId, AccountName, AccountNumber, AccountShortName, AccountType, AccountTypeId, ArchivedOn, BillingAddressCity, BillingAddressCountry, BillingAddressState, BillingAddressStreet, BillingAddressZip, CreatedById, CreatedDate, Division, Fax, LastUpdatedById, LastUpdatedDate, MainAddressCity, MainAddressCountry, MainAddressState, MainAddressStreet, MainAddressZip, NewsKeywords, OwnerId, ParentAccount, ParentAccountId, Phone, PrimaryContactId, QuickbooksLastSynced, ShippingAddressCity, ShippingAddressCountry, ShippingAddressState, ShippingAddressStreet, ShippingAddressZip, SourceSystemId, SyncWithQuickBooks, Ticker, Url]
		# 
		# Currently Searchable Opportunity Fields:
		# 
		# 	[AccountId, AccountName, ArchivedOn, ClosedDate, ComputedConfidence, ComputedForecastDate, CreatedById, CreatedDate, CurrentPhaseId, CurrentPhaseName, DealValue, Description, IsHot, LastUpdatedById, LastUpdatedDate, LeadSource, LeadSourceId, Name, OpportunityId, OverriddenConfidence, OverriddenForecastDate, OverrideComments, OwnerId, PaymentTerms, PaymentTermsId, QuickbooksLastSynced, QuickbooksTransactionType, SellingProcess, SellingProcessId, SourceSystemId, StartDate, Status, StatusId, StatusReason, StatusReasonId, SuspendedDate]
		# 
		# Currently Searchable Duration Type Fields:
		# 	[DurationType, DurationTypeId]
		# 
		# Currently Searchable Product Family Fields:
		# 	[Description, ParentProductFamily, ParentProductFamilyId, ProductFamily, ProductFamilyId]
		attr_reader :field_id
		

		attr_reader :operator

		# @param [String] query_value
		attr_reader :query_value

	  # @param [String] field_id 
	  # @param [String, WsSearchOperator] operator 
		# Contains: returns values that contain the given search string
		# SoundsLike: returns values that “sound like” the given search string (smythe = smith)
		# Equals: returns values that are identically equal (case-insensitive) the given search value
		# NotEquals: returns values that are not  equal (case-insensitive) the given search value
		# LessThan: returns values that are less than the given search value
		# LessThanOrEqual: returns values that are less than or equal to the given search value
		# GreaterThan: returns values that are greater than the given search value
		# GreaterThanOrEqual: returns values that are greater than or equal to the given search value
		# Empty: returns values that are empty (null)
		# NotEmpty: returns values that are not empty (not null)
		# True: returns values that are logically True
		# False: returns values that are logically False,
		# In: returns values that are in the specified list
		# NotIn: returns values that are not in the specified list
		# @param [String] query_value the group ID
		def initialize(field_id, operator, query_value)
			@field_id = field_id
			@operator = operator
			@query_value = query_value
		end
	
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
