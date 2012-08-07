require "form_shui/version"

module FormShui
  autoload :Connection, 'form_shui/connection'
  autoload :Mapper, 'form_shui/mapper'
  autoload :Base, 'form_shui/base'
  autoload :Form, 'form_shui/models/form'
  extend Connection
end
