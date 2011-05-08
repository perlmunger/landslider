
class Landslider

	class WsAccount < WsEntity
		
		# @return [Integer]
		attr_reader :account_id, :account_owner, :archived_by, :create_by, :update_by, :parent_account_id
		
		# @return [String]
		attr_reader :account_name, :account_number, :division

		# @return [Date]
		attr_reader :created_on, :updated_on
		
	end
	
end
	# private String accountName;
	# private String accountNumber;
	# private WsAccountType accountType;
	# private Date archivedOn;
	# private WsAddress billingAddress;
	# private int createBy;
	# private Date createdOn;
	# private int updateBy;
	# private Date updatedOn;
	# private String division;
	# private String fax;
	# private WsAddress mainAddress;
	# private String newsKeywords;
	# private String phone;
	# private WsAddress shippingAddress;
	# private String shortName;
	# private String sourceId;
	# private String ticker;
	# private String url;
	# private List<WsAccountCustomField> _customFields = new ArrayList<WsAccountCustomField>();
	# private int parentAccountId;
	# private String parentAccountName;
	# private boolean isSyncWithQuickbooks;
	# private Date quickbooksLastSynced;
	# private WsContact primaryContact;
