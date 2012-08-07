module FormShui
  class Form < Base
    path_name "/forms"
    root_param "form"

    def self.find_by_organization_id(id)
      response = FormShui.api_connection.get "/organizations/#{id}/forms"
      doc = JSON.parse(response.body)
      if doc.is_a? Array
        doc.map{|x|  self.class_eval("new(#{x})") }
      end
    end

    def self.find_by_promotion_id(id)
      response = FormShui.api_connection.get "/promotions/#{id}/forms"
      doc = JSON.parse(response.body)
      if doc.is_a? Array
        doc.map{|x|  self.class_eval("new(#{x})") }
      end
    end
  end
end
