module FormShui
  class Hook < Base
    path_name  "/form/:form_id/hooks"
    root_param "hook"

    class << self
      def list(form_id)
        response = request.get("/form/#{form_id}/hooks", nil)
        response.body
      end

      def get(hook_id)
        response = request.get("/hooks/#{hook_id}", nil)
        response.body
      end

      def post(form_id, params_list)
        response = request.post("/form/#{form_id}/hooks", params_list)
        response.body
      end

      def patch(hook_id, params_list)
        response = request.patch("/hooks/#{hook_id}", params_list)
        response.body
      end

      def delete(hook_id)
        response = request.delete("/hooks/#{hook_id}")
        response.body
      end

    end
  end
end
