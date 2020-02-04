#1. Use a branch or create a new branch

## Existing branch
curl -s -XGET https://api.leapos.ca/obp/v4.0.0/banks/BANK_ID/branches -H 'Authorization: DirectLogin token="$TOKEN"'

## New branch
curl -s -XPOST https://api.leapos.ca/obp/v4.0.0/banks/$ACME_BANK_ID/branches -H "Content-Type: application/json" -H 'Authorization: DirectLogin token="$TOKEN"' -d '{"bank_id":$ACME_BANK_ID","id":"$BRANCH_ID","name":"$BRANCH_NAME","address":{"line_1":"$BRANCH_ADDRESS_LINE1","line_2":"$BRANCH_ADDRESS_LINE2","line_3":"$BRANCH_ADDRESS_LINE3","city":"$BRANCH_ADDRESS_CITY","county":"$BRANCH_ADDRESS_COUNTRY","state":"$BRANCH_ADDRESS_STATE","postcode":"$BRANCH_ADDRESS_POSTALCODE","country_code":"$BRANCH_ADDRESS_COUNTRY_CODE"},"location":{"latitude":10,"longitude":10},"meta":{"license":{"id":"PDDL","name":"Open Data Commons Public Domain Dedication and License "}},"lobby":{"monday":[{"opening_time":"10:00","closing_time":"18:00"}],"tuesday":[{"opening_time":"10:00","closing_time":"18:00"}],"wednesday":[{"opening_time":"10:00","closing_time":"18:00"}],"thursday":[{"opening_time":"10:00","closing_time":"18:00"}],"friday":[{"opening_time":"10:00","closing_time":"18:00"}],"saturday":[{"opening_time":"10:00","closing_time":"18:00"}],"sunday":[{"opening_time":"10:00","closing_time":"18:00"}]},"drive_up":{"monday":{"opening_time":"10:00","closing_time":"18:00"},"tuesday":{"opening_time":"10:00","closing_time":"18:00"},"wednesday":{"opening_time":"10:00","closing_time":"18:00"},"thursday":{"opening_time":"10:00","closing_time":"18:00"},"friday":{"opening_time":"10:00","closing_time":"18:00"},"saturday":{"opening_time":"10:00","closing_time":"18:00"},"sunday":{"opening_time":"10:00","closing_time":"18:00"}},"branch_routing":{"scheme":"OBP","address":"123abc"},"is_accessible":"true","accessibleFeatures":"wheelchair, atm usuable by the visually impaired","branch_type":"Full service store","more_info":"short walk to the lake from here","phone_number":"+381631954907"}'

# 2. Use a product or create a new product

## Existing product
curl -s -XGET https://api.leapos.ca/obp/v4.0.0/banks/BANK_ID/products -H 'Authorization: DirectLogin token="$TOKEN"'

## New product
curl -s -XPUT https://api.leapos.ca/obp/v4.0.0/banks/$ACME_BANK_ID/products/$PRODUCT_ID -H "Content-Type: application/json" -H 'Authorization: DirectLogin token="$TOKEN' -d '{"bank_id":"$ACME_BANK_ID","name":"$PRODUCT_NAME","parent_product_code":"$PRODUCT_PARENT_CODE","category":"$PRODUCT_CATEGORY","family":"$PRODUCT_FAMILY_NAME","super_family":"$PRODUCT_SUPER_FAMILY","more_info_url":"$PRODUCT_INFORMATION_URL","details":"$PRODUCT_DETAILS","description":"$PRODUCT_DESCRIPTION","meta":{"license":{"id":"$PRODUCT_LICENSE_ID","name":"$PRODUCT_LICENSE_NAME"}}}'

#3. Create an account

curl -s -XPUT https://api.leapos.ca/obp/v4.0.0/banks/$ACME_BANK_ID/accounts/$ACCOUNT_ID -H "Content-Type: application/json" -H 'Authorization: DirectLogin token="$TOKEN"' -d '{"user_id":"$USER_ID","label":"$ACCOUNT_LABEL","product_code":"$PRODUCT_CODE","balance":{"currency":"CAD","amount":"$ACCOUNT_AMOUNT"},"branch_id":"$BRANCH_ID","account_routing":{"scheme":"$ACCOUNT_ROUTING_SCHEME","address":"$ACCOUNT_ROUTING_ADDRESS"},"account_attributes":[{"product_code":"$PRODUCT_CODE","account_attribute_id":"$ACCOUNT_ATTRIBUTE","name":"$ACCOUNT_ATTRIBUTE_NAME","type":"$ACCOUNT_ATTRIBUTE_TYPE","value":"$ACCOUNT_ATTRIBUTE_VALUE"}]}'