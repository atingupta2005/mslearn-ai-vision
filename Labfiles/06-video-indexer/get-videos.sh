#!/bin/bash

source ~/.env

location="trial"

# Call the AccessToken method with the API key in the header to get an access token
token=$(curl -s -X GET -H "Ocp-Apim-Subscription-Key: $VIDEOINDEXER_API_KEY" "https://api.videoindexer.ai/auth/$location/Accounts/$VIDEOINDEXER_ACCOUNT_ID/AccessToken" | jq -r '.')

# Use the access token to make an authenticated call to the Videos method to get a list of videos in the account
curl -s -X GET "https://api.videoindexer.ai/$location/Accounts/$VIDEOINDEXER_ACCOUNT_ID/Videos?accessToken=$token" | jq .
