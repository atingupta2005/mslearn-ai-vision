#!/bin/bash

account_id="YOUR_ACCOUNT_ID"
api_key="YOUR_API_KEY"
location="trial"

# Call the AccessToken method with the API key in the header to get an access token
token=$(curl -s -X GET -H "Ocp-Apim-Subscription-Key: $api_key" "https://api.videoindexer.ai/auth/$location/Accounts/$account_id/AccessToken" | jq -r '.')

# Use the access token to make an authenticated call to the Videos method to get a list of videos in the account
curl -s -X GET "https://api.videoindexer.ai/$location/Accounts/$account_id/Videos?accessToken=$token" | jq .
