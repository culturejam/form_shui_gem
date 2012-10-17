require "json"
module FormShui
  module Mapper
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def all(options = {})
        if prefix
          prefix_id = options.delete(:prefix)[prefix.to_sym]
          path = compile_path(prefix_id)
        end

        path ||= self.path

        response = FormShui.api_connection.get path, options
        parse_doc(response.body)
      end

      def find(*arguments)
        id = arguments.slice!(0)
        options = arguments.slice!(0) || {}

        if prefix
          prefix_id = options.delete(:prefix)[prefix.to_sym]
          path = "#{compile_path(prefix_id)}/#{id}"
        else
          path = "#{self.path}/#{id}"
        end

        response = FormShui.api_connection.get path, options
        parse_doc(response.body)
      end

      def create(attrs = {})
        if prefix
          prefix_id = attrs.delete(:prefix)[prefix.to_sym]
          path = compile_path(prefix_id)
        end

        path ||= self.path

        response = FormShui.api_connection.post path do |request|
          request.headers['Content-Type'] = 'application/json'
          request.body = { root => attrs }.to_json
        end
        parse_doc(response.body)
      end

      def root_param(root_param)
        self.root = root_param
      end

      def path_name(path)
        self.path   = path
        self.prefix = path.match(/(:\w+)/).to_s[1..-1]
      end

      attr_accessor :prefix, :path, :root

      private

      def compile_path(prefix_id)
        path.gsub(/(:\w+)/, prefix_id.to_s)
      end

      def parse_doc(body)
        doc = JSON.parse(body)
        if doc.is_a? Array
          doc.map{|x|  self.class_eval("new(#{x})") }
        else
          self.class_eval("new(#{doc})")
        end
      end
    end

    def path
      if self.class.prefix
        path_name = self.class.path.gsub(/(:\w+)/, self.send(self.class.prefix))
        "#{path_name}/#{id}"
      else
        "#{self.class.path}/#{id}"
      end
    end

    def update(attrs = {})
      response = FormShui.api_connection.put self.path do |request|
        request.headers['Content-Type'] = 'application/json'
        request.body = { self.class.root => attrs }.to_json
      end
      doc = JSON.parse(response.body)
      self.marshal_load(doc)
      self
    end

    def destroy
      response = FormShui.api_connection.delete self.path
    end

  end
end
