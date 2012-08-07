require "form_shui/version"
require File.expand_path('../form_shui/error', __FILE__)
module FormShui
  autoload :Connection, 'form_shui/connection'
  autoload :Mapper, 'form_shui/mapper'
  autoload :Base, 'form_shui/base'
  autoload :Form, 'form_shui/models/form'
  autoload :Answer, 'form_shui/models/answer'
  extend Connection
end
