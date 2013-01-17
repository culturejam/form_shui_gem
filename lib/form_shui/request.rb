module FormShui
  class Request

    def initialize(connection, config)
      @config     = config
      @connection = connection
      validate_config!
    end

    def get(path, options)
      connection.get(path, options) do |request|
        request.sign! @config.hmac_access_id, @config.hmac_secret
      end
    end

    def post(path, body)
      send_json_requeset(:post, path, body)
    end

    def put(path, body)
      send_json_requeset(:put, path, body)
    end

    def delete(path)
      connection.delete(path)
    end

    private

    def validate_config!
      raise FormShuiError, "FormShui configuration missing" unless @config
      raise FormShuiError, "FormShui configuration missing hmac_access_id or hmac_secret" \
        if @config.hmac_access_id.blank? || @config.hmac_secret.blank?
    end

    def send_json_requeset(method, path, body)
      connection.send(method, path) do |request|
        request.headers['Content-Type'] = 'application/json'
        request.body = body
        request.sign! @config.hmac_access_id, @config.hmac_secret
      end
    end

    attr_reader :connection

  end
end
