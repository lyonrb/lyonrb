# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
Rails.application.config.session_store = {
  :key    => '_lyonrb_session',
  :secret => '8df25d173c2643f22b174fb7cb64185f599bfef912873b4e264a5be5d0fc39bc5b94b9fd5f3f82179aa089f8a296d164991dde4512a2aa48d81d186bf3d89b82'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
