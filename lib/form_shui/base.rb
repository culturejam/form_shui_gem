require 'ostruct'

module FormShui
  class Base < OpenStruct
    include FormShui::Mapper
  end
end
