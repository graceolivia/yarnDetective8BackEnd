# frozen_string_literal: true

module Api
  class HttpartyWrapper
    include HTTParty
    base_uri 'https://api.ravelry.com'

    def initialize
      secret_username = Rails.application.credentials.dig(:ravelry, :username)
      secret_password = Rails.application.credentials.dig(:ravelry, :password)
      @auth = { username: secret_username, password: secret_password }
    end

    def get_request(url)
      options = { basic_auth: @auth }
      self.class.get(url, options)
    end
  end
end
