module FormShui
  module Record

    def update(attrs = {})
      response = request.put path, { root => attrs }.to_json
      doc = JSON.parse(response.body)
      self.marshal_load(doc)
      self
    end

    def destroy
      request.delete path
    end

    private

    def path
      path_root = self.class.build_path { |prefix| send(prefix) }
      [path_root, id].join("/")
    end

  end
end
