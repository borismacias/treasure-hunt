### Setup

0. bundle install
1. rails db:create
2. rails db:migrate
3. rails db:seed
4. With rails console, get the access token that was generated for the demo user
5. Send the access token as the header 'access-token' to be able to use the api

### API DOCS

http://localhost:3000/api-docs


### What's this?

This is a treasure hunt game.
If the setup worked properly, you now have an admin account and its access token.
To check this admin token you can run this rake task: `rails admin:display_access_token`
Before sending any request, make sure to set the 'access_token' header to the access token of your account.
To create new player accounts you need to send a POST request to '/users' using an admin access token.
For the rest of endpoints, you could use a player or admin access token.
The target latitude TARGET_LAT and target longitude TARGET_LNG need to configured as environmental variables.
