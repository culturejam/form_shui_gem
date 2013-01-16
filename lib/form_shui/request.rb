module FormShui
  class Request

    def initialize(connection)
      @connection = connection
    end

    def get(path, options)
      # connection.get(path, options)
      connection.get(path, options) do |request|
        request.sign! 'access_id', 'secret'
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

    def send_json_requeset(method, path, body)
      connection.send(method, path) do |request|
        request.headers['Content-Type'] = 'application/json'
        request.body = body
      end
    end

    attr_reader :connection

  end
end
