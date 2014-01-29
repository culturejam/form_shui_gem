module FormShui
  class Answer < Base
    path_name  "/forms/:form_id/answers"
    root_param "answer"

    def self.find_answers_count_by_form_id(id)
      response = request.get("/forms/#{id}/answers/count", nil)
      response.body
    end
  end
end
