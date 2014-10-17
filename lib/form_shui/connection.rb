require "uri"
require 'faraday_middleware'
require "faraday/auth-hmac"

Dir[File.expand_path('../../faraday/*.rb', __FILE__)].each{|f| require f}

module FormShui
  module Connection
    attr_writer :api_url

    def api_url
      @api_url ||= "http://promojam.dev:4567"
    end

    def api_connection
      @api_connection ||= Faraday.new(url: api_url, ssl: { version: :TLSv1 }) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.request  :auth_hmac               # enables request signing
        faraday.response :raise_error
        faraday.use      FaradayMiddleware::RaiseHttpException
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
  end
end
