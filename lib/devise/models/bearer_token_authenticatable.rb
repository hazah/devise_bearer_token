require 'devise/strategies/bearer_token_authenticatable'

module Devise
  module Models
    module BearerTokenAuthenticatable
      extend ActiveSupport::Concern

      def self.required_fields
        [:tokens]
      end

      def bearer_token_options
        self.class.bearer_token_options
      end

      def after_bearer_token_authentication
      end

      module ClassMethods
        def serialize_into_bearer_token(record)

        end

        def serialize_from_bearer_token(token_values)
          record = to_adapter.find_first(token_values)
        end

        Devise::Models.config(self, :bearer_token_options, :extend_bearer_token_period, :bearer_token_strategy, :bearer_token_fields)
      end
    end
  end
end
