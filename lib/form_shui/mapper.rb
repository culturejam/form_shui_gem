module FormShui
  module Mapper
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def find(query = {})
        @@api_connection.get @@path_name, query
      end

      def create(query = {})
        @@api_connection.post @@path_name, query
      end

      def update(query = {})
        @@api_connection.put @@path_name, query
      end

      def destroy(query = {})
        @@api_connection.delete @@path_name, query
      end
    end
  end
end
