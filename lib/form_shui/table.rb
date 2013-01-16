module FormShui
  module Table

    def all(options = {})
      path = build_path(options)
      response = request.get(path, options)
      parse_doc(response.body)
    end

    def find(*arguments)
      id = arguments.slice!(0)
      options = arguments.slice!(0) || {}

      path_root = build_path(options)
      path = [path_root, id].join("/")

      response = request.get path, options
      parse_doc(response.body)
    end

    def create(options = {})
      path = build_path(options)
      response = request.post path, { root => options }.to_json
      parse_doc(response.body)
    end

    private

    def parse_doc(body)
      instantize JSON.parse(body)
    end

    def instantize(doc)
      if doc.is_a? Array
        doc.map {|x| instantize(x) }
      else
        new(doc)
      end
    end

  end
end
