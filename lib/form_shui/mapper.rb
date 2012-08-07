require "json"
module FormShui
  module Mapper
    def self.included(base)
      base.send :extend, ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      def find(*arguments)
        id   = arguments.slice!(0)
        options = arguments.slice!(0) || {}
        path = "#{@@path}/#{id}"
        response = FormShui.api_connection.get path, options
        doc = JSON.parse(response.body)
        self.class_eval("new(#{doc})")
      end

      def create(attrs = {})
        response = FormShui.api_connection.post @@path do |request|
          request.headers['Content-Type'] = 'application/json'
          request.body = { @@root => attrs }.to_json
        end
        doc = JSON.parse(response.body)
        self.class_eval("new(#{doc})")
      end

      def root_param(root_param)
        @@root = root_param
      end

      def path_name(path)
        @@path = path
      end

      def path
        @@path
      end

      def root
        @@root
      end
    end

    module InstanceMethods

      def path
        "#{self.class.path}/#{id}"
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

end
