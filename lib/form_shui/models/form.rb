module FormShui
  class Form < Base
    path_name  "/forms"
    root_param "form"

    def self.find_by_organization_id(id)
      response = request.get "/organizations/#{id}/forms"
      parse_doc(response.body)
    end

    def self.find_by_promotion_id(id)
      response = request.get "/promotions/#{id}/forms"
      parse_doc(response.body)
    end
  end
end
