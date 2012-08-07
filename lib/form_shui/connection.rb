require "uri"
require 'faraday_middleware'
Dir[File.expand_path('../../faraday/*.rb', __FILE__)].each{|f| require f}
module FormShui
  module Connection
    @@api_url = "http://promojam.dev:4567"

    def api_url
      @@api_url
    end

    def api_url=(url)
      @@api_url = url
    end

    def api_connection
      @api_connection = Faraday.new(:url => @@api_url) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.response :raise_error
        faraday.use FaradayMiddleware::RaiseHttpException
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
      @api_connection
    end
  end
end
