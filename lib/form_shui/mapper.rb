require "json"

module FormShui
  module Mapper
    def self.included(base)
      base.send :extend,  ClassMethods
      base.send :extend,  FormShui::Table
      base.send :include, FormShui::Record
    end

    module ClassMethods

      def build_path(options = {})
        if @prefix
          prefix_id = if block_given?
                        yield(@prefix)
                      else
                        options.delete(:prefix)[@prefix]
                      end

          compile_path(prefix_id)
        else
          @path
        end
      end

      def root_param(root_param)
        @root = root_param
      end

      def path_name(path)
        @path   = path
        prefix  = path.match(/(:\w+)/).to_s[1..-1]
        @prefix = prefix && prefix.to_sym
      end

      def request
        @_request ||= FormShui::Request.new(FormShui.api_connection, FormShui.config)
      end

      attr_reader :root

      private

      def compile_path(prefix_id)
        @path.gsub(/(:\w+)/, prefix_id.to_s)
      end

    end

    def request
      self.class.request
    end

    def root
      self.class.root
    end

  end
end
