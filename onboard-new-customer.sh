
#1. Use a branch or create a new branch

## Existing branch
curl -s -XGET https://api.leapos.ca/obp/v4.0.0/banks/BANK_ID/branches -H 'Authorization: DirectLogin token="$TOKEN"'

## New branch
curl -s -XPOST https://api.leapos.ca/obp/v4.0.0/banks/$ACME_BANK_ID/branches -H "Content-Type: application/json" -H 'Authorization: DirectLogin token="$TOKEN"' -d '{"bank_id":$ACME_BANK_ID","id":"$BRANCH_ID","name":"$BRANCH_NAME","address":{"line_1":"$BRANCH_ADDRESS_LINE1","line_2":"$BRANCH_ADDRESS_LINE2","line_3":"$BRANCH_ADDRESS_LINE3","city":"$BRANCH_ADDRESS_CITY","county":"$BRANCH_ADDRESS_COUNTRY","state":"$BRANCH_ADDRESS_STATE","postcode":"$BRANCH_ADDRESS_POSTALCODE","country_code":"$BRANCH_ADDRESS_COUNTRY_CODE"},"location":{"latitude":10,"longitude":10},"meta":{"license":{"id":"PDDL","name":"Open Data Commons Public Domain Dedication and License "}},"lobby":{"monday":[{"opening_time":"10:00","closing_time":"18:00"}],"tuesday":[{"opening_time":"10:00","closing_time":"18:00"}],"wednesday":[{"opening_time":"10:00","closing_time":"18:00"}],"thursday":[{"opening_time":"10:00","closing_time":"18:00"}],"friday":[{"opening_time":"10:00","closing_time":"18:00"}],"saturday":[{"opening_time":"10:00","closing_time":"18:00"}],"sunday":[{"opening_time":"10:00","closing_time":"18:00"}]},"drive_up":{"monday":{"opening_time":"10:00","closing_time":"18:00"},"tuesday":{"opening_time":"10:00","closing_time":"18:00"},"wednesday":{"opening_time":"10:00","closing_time":"18:00"},"thursday":{"opening_time":"10:00","closing_time":"18:00"},"friday":{"opening_time":"10:00","closing_time":"18:00"},"saturday":{"opening_time":"10:00","closing_time":"18:00"},"sunday":{"opening_time":"10:00","closing_time":"18:00"}},"branch_routing":{"scheme":"OBP","address":"123abc"},"is_accessible":"true","accessibleFeatures":"wheelchair, atm usuable by the visually impaired","branch_type":"Full service store","more_info":"short walk to the lake from here","phone_number":"+381631954907"}'

#2. Use a product or create a new product
## Existing product
curl -s -XGET https://api.leapos.ca/obp/v4.0.0/banks/BANK_ID/products -H 'Authorization: DirectLogin token="$TOKEN"'

## New product
curl -s -XPUT https://api.leapos.ca/obp/v4.0.0/banks/$ACME_BANK_ID/products/$PRODUCT_ID -H "Content-Type: application/json" -H 'Authorization: DirectLogin token="$TOKEN' -d '{"bank_id":"$ACME_BANK_ID","name":"$PRODUCT_NAME","parent_product_code":"$PRODUCT_PARENT_CODE","category":"$PRODUCT_CATEGORY","family":"$PRODUCT_FAMILY_NAME","super_family":"$PRODUCT_SUPER_FAMILY","more_info_url":"$PRODUCT_INFORMATION_URL","details":"$PRODUCT_DETAILS","description":"$PRODUCT_DESCRIPTION","meta":{"license":{"id":"$PRODUCT_LICENSE_ID","name":"$PRODUCT_LICENSE_NAME"}}}'

#3.  Create a customer
curl -s -XPOST https://api.leapos.ca/obp/v4.0.0/banks/$ACME_BANK_ID/customers -H "Content-Type: application/json" -H 'Authorization: DirectLogin token="$TOKEN"' -d '{  "legal_name":"$CUSTOMER_LEGAL_NAME",  "mobile_phone_number":"$CUSTOMER_MOBILE_NUMBER",  "email":"$CUSTOMER_EMAIL",  "face_image":{    "url":"$CUSTOMER_IMAGE_URL",    "date":"$CUSTOMER_IMAGE_DATE"  },  "date_of_birth":"$CUSTOMER_DATE_OF_BIRTH",  "relationship_status":"$CUSTOMER_RELATIONSHIP_STATUS",  "dependants":$CUSTOMER_DEPENDANTS,  "dob_of_dependants":["2017-09-19T00:00:00Z"],  "credit_rating":{    "rating":"$CUSTOMER_CREDIT_RATING",    "source":"$CUSTOMER_CREDIT_RATING_SOURCE"  },  "credit_limit":{    "currency":"$CUSTOMER_CREDIT_LIMIT_CURR",    "amount":"$CUSTOMER_CREDIT_LIMIT_AMOUNT"  },  "highest_education_attained":"Master",  "employment_status":"worker",  "kyc_status":$CUSTOMER_KYC_STATUS,  "last_ok_date":"2017-09-19T00:00:00Z",  "title":"Dr.",  "branch_id":"$CUSTOMER_BRANCH_ID",  "name_suffix":"Sr"}'

#4. Create a user customer link
curl -s XPOST https://api.leapos.ca/obp/v4.0.0/banks/$ACME_BANK_ID/user_customer_links -H "Content-Type: application/json" -H 'Authorization: DirectLogin token="$TOKEN"' -d '{"user_id": "$USER_ID", "customer_id": "$CUSTOMER_ID"}'

#4. Create account
curl -s -XPUT https://api.leapos.ca/obp/v4.0.0/banks/$ACME_BANK_ID/accounts/$ACCOUNT_ID -H "Content-Type: application/json" -H 'Authorization: DirectLogin token="$TOKEN"' -d '{"user_id":"$USER_ID","label":"$ACCOUNT_LABEL","product_code":"$PRODUCT_CODE","balance":{"currency":"CAD","amount":"$ACCOUNT_AMOUNT"},"branch_id":"$BRANCH_ID","account_routing":{"scheme":"$ACCOUNT_ROUTING_SCHEME","address":"$ACCOUNT_ROUTING_ADDRESS"},"account_attributes":[{"product_code":"$PRODUCT_CODE","account_attribute_id":"$ACCOUNT_ATTRIBUTE","name":"$ACCOUNT_ATTRIBUTE_NAME","type":"$ACCOUNT_ATTRIBUTE_TYPE","value":"$ACCOUNT_ATTRIBUTE_VALUE"}]}'

#5. Add a view for the account
curl -s -XGET https://api.leapos.ca/obp/v4.0.0/banks/$ACME_BANK_ID/accounts/$BANK_ACCOUNT_ID/views -H 'Authorization: DirectLogin token="$TOKEN"'

#6. Create a card
curl -s -XPOST https://api.leapos.ca/obp/v4.0.0/management/banks/$ACME_BANK_ID/cards -H "Content-Type: application/json" -H 'Authorization: DirectLogin token="$TOKEN"' -d '{"card_number":"$CARD_NUMBER","card_type":"$CARD_TYPE","name_on_card":"$CARD_NAME","issue_number":"1","serial_number":"$CARD_SERIAL_NUMBER","valid_from_date":"2017-09-19T00:00:00Z","expires_date":"2017-09-19T00:00:00Z","enabled":true,"technology":"technology1","networks":["network1","network2"],"allows":["credit","debit"],"account_id":"$BANK_ACCOUNT_ID"',"replacement":{"requested_date":"2017-09-19T00:00:00Z","reason_requested":"RENEW"},"pin_reset":[{"requested_date":"2017-09-19T00:00:00Z","reason_requested":"FORGOT"},{"requested_date":"2019-09-03T17:59:14Z","reason_requested":"GOOD_SECURITY_PRACTICE"}],"collected":"2017-09-19T00:00:00Z","posted":"2017-09-19T00:00:00Z","customer_id":"$CUSTOMER_ID"}'