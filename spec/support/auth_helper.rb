# frozen_string_literal: true

require 'devise/jwt/test_helpers'

module AuthHelper
  def get_jwt(user)
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
    auth_headers['Authorization']
  end
end
