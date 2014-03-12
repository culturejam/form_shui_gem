module FormShui
  class Hook < Base
    path_name  "/form/:form_id/hooks"
    root_param "hook"

    class << self
      def get_all_hooks(form_id)
        response = request.get("/form/#{form_id}/hooks", nil)
        response.body
      end

      def get_hook(form_id, hook_id)
        response = request.get("/form/#{form_id}/hooks/#{hook_id}", nil)
        response.body
      end

      def post(form_id, params_list)
        response = request.post("/form/#{form_id}/hooks", params_list)
        response.body
      end

      def patch(form_id, hook_id, params_list)
        response = request.patch("/form/#{form_id}/hooks/#{hook_id}", params_list)
        response.body
      end

      def delete(form_id, hook_id)
        response = request.delete("/form/#{form_id}/hooks/#{hook_id}")
        response.body
      end

    end
  end
end
