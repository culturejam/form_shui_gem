module FormShui
  class Answer < Base
    path_name  "/forms/:form_id/answers"
    root_param "answer"

    def self.get_count(form_id)
      response = request.get("/forms/#{form_id}/answers/count", nil)
      response.body
    end

    def self.get(*args)
      form_id = args[0]
      page = args[1]
      per_page = args[2]
      options_hash = args.last.is_a?(Hash) ? args.pop : {}

      response = request.get(
        "/forms/#{form_id}/answers?page=#{page}&per_page=#{per_page}", nil
      )

      response.body
    end
  end
end
