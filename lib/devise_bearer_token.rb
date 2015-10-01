module DeviseBearerToken
end

Devise.setup do |config|
  config.bearer_token_fields = [ :access_token, :token_type, :client, :expiry, :uid ]
  config.bearer_token_strategy = :headers
end

Devise.add_module :bearer_token_authenticatable, model: true, strategy: true
