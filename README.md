Landslider
==========

Ruby interface to Landslide's SOAP-based API

Introduction
------------

This gem can be used to communicate with Landslide's SOAP-based API using ruby code.
	
[WSDL](https://jaytest.api.landslide.com/webservices/SoapService?wsdl) endpoint url: [https://jaytest.api.landslide.com/webservices/SoapService?wsdl](https://jaytest.api.landslide.com/webservices/SoapService?wsdl)

If you already have a landslide account, contact support to enable the API.  You can also start a 30-day trial account [here](http://www.landslide.com/~jayp/en/trial).  

Dependencies
------------

	$ gem install jeweler curb handsoap

Installation
------------


	$ gem install landslider

Documentation
-------------

	Read the [ruby doc](http://www.rubydoc.info/github/j4y/landslider/master/frames).

Configuration
-------------

See bin/genarate_api_key.rb for details on generating your API key
	
	LS_INSTANCE_NAME = 'jaytest'
	LS_API_USERNAME = 'jayp@landslide.com'
	LS_API_KEY = '53308ccbdcb7f23fbd81a0b2ebcf12a4'

Usage
-----

This is calling login to get a session id which is then used to get a list of accounts.
		
	require 'landslider'
	response = Landslider.login('LOGINTOKEN=' + LS_INSTANCE_NAME)
	response = Landslider.get_accounts(response[:session_id])
	response[:accounts].each do |account| 
		puts "id: #{account[:account_id]} name: #{account[:account_name]}"
	end




Testing
-------

The default rake task is set to run the tests.
	
	$ rake
	
Tests are needed here because the API uses a specific XML structure for requests and responses.
	

Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_markup`)
3. Commit your changes (`git commit -am "Added Snarkdown"`)
4. Push to the branch (`git push origin my_markup`)
5. Create an [Issue][1] with a link to your branch
6. Enjoy a refreshing Diet Coke and wait
	
API methods
-----------

	Here is a list of API methods that have been added:

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
* runMyListbyId

TODO
----

* Modify configuration to be rails 3 friendly.  The configuation was needed before the environment finished loading. See landslide-rails
* add more API calls
* use HTTP cookies to maintain session state. maybe something like http_request.headers.merge!({'cookie' => ["JSESSIONID=#{self.session_id}"]})
* eliminate slow inefficient XPath queries
* eliminate test data dependency on the jaytest instance
