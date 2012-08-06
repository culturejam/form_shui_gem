module FormShui
  module Connection

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
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
      @api_connection
    end
  end
end
