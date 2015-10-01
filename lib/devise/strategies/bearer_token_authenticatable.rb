require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class BearerTokenAuthenticatable < Authenticatable
      def store?
        false
      end

      def valid?
        token_values.present?
      end

      def authenticate!
        resource = mapping.to.serialize_from_bearer_token(token_values)

        return pass unless resource

        if validate(resource)
          resource.after_bearer_token_authentication
          success!(resource)
        end
      end

    private

      def token_values
        send(:"#{mapping.to.bearer_token_strategy}_token_values")
      end

      def headers_token_values
        request.headers.symbolize_keys.slice(mapping.to.bearer_token_fields)
      end

      def params_token_values
        params.slice(mapping.to.bearer_token_fields)
      end
    end
  end
end

Warden::Strategies.add(:bearer_token_authenticatable, Devise::Strategies::BearerTokenAuthenticatable)
