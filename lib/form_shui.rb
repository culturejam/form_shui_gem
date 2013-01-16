$:.push File.dirname(__FILE__)

require "form_shui/core_ext"
require "form_shui/version"
require "form_shui/error"

module FormShui
  autoload :Connection, 'form_shui/connection'
  autoload :Request,    'form_shui/request'
  autoload :Table,      'form_shui/table'
  autoload :Record,     'form_shui/record'
  autoload :Mapper,     'form_shui/mapper'
  autoload :Base,       'form_shui/base'
  autoload :Form,       'form_shui/models/form'
  autoload :Answer,     'form_shui/models/answer'

  extend Connection

  # Can only be called before the connection make a request.
  def self.enable_faraday_logger
    api_connection.response :logger
  end
end
