module FormShui
  class Answer < Base
    path_name  "/forms/:form_id/answers"
    root_param "answer"

    def self.get_count(form_id)
      response = request.get("/forms/#{form_id}/answers/count", nil)
      response.body
    end

    def self.get_one_answer(form_id)
      response = request.get("/forms/#{form_id}/answers/random", nil)
      response.body
    end

    def self.get(form_id, *args)
      options_hash = args.last.is_a?(Hash) ? args.pop : {}
      response = request.get("/forms/#{form_id}/answers", options_hash)
      response.body
    end
  end
end
