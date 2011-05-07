= Landslider

Ruby interface to Landslide's SOAP-based API

== Introduction

	This gem can be used to communicate with Landslide's SOAP-based API using ruby code.
	
	[WSDL](https://jaytest.api.landslide.com/webservices/SoapService?wsdl) endpoint url: https://jaytest.api.landslide.com/webservices/SoapService?wsdl

	If you already have landslide account contact support to enable the API.  You can also start a 30-day trial account [here](http://www.landslide.com/~jayp/en/trial).

=== Ruby gem dependencies

	gem install jeweler curb handsoap

== Installation
	
	Use RubyGems to install these run-time dependencies: 
	* curb
	* jeweler
	* handsoap
	
	gem install landslider

== Configuration

	See bin/genarate_api_key.rb for details on generating your API key
	
	LS_INSTANCE_NAME = 'jaytest'
	LS_API_USERNAME = 'jayp@landslide.com'
	LS_API_KEY = '53308ccbdcb7f23fbd81a0b2ebcf12a4'

== Usage

	This is calling login to get a session id which is then used to get a list of accounts.
		
	require 'landslider'
	response = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)
	response = Landslider.get_accounts(response[:session_id])
	response[:accounts].each do |account| 
		puts "id: #{account[:account_id]} name: #{account[:account_name]}"
	end

== TODO list

	* Modify configuration to be rails 3 friendly.  The configuation was needed before the environment finished loading. See landslide-rails
	* add more API calls
	* use HTTP cookies to maintain session state. maybe something like http_request.headers.merge!({'cookie' => ["JSESSIONID=#{self.session_id}"]})
	* eliminate slow inefficient XPath queries
	* eliminate test data dependency on the jaytest instance
	

== Testing

	The default rake task is set to run the tests.
	
	$ rake
	
	Tests are needed here because the API uses a specific XML structure for requests and responses.
	
== Contributing

	Read the github doc on forking:
	http://help.github.com/forking/
	
== API methods

	These are the api methods that can be called.  There are plenty of others to map out.

	* login
	* getApiVersion
	* getAccounts
	* getAccountById
	* getAccountCustomFields
	* getAccountContacts
	* getAccountNotes
	* getAccountOpportunities
	* getContacts
	* getContactCustomFields
	* getContactNotes
	* getInstanceInformation
	* getLeads
	* getLeadCustomFields
	* getLeadNotes
	* getOpportunities
	* getOpportunityCustomFields
	* getOpportunityNotes
	* getUserInformation
	* getUserInformationById
