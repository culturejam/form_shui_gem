module FormShui
  class FormShuiError < StandardError;       end
  class BadRequest < FormShuiError;          end # 400 Bad Request
  class UnauthorizedAccess < FormShuiError;  end # 401 Unauthorized
  class ForbiddenAccess < FormShuiError;     end # 403 Forbidden
  class NotFound < FormShuiError;            end # 404 Not Found
  class ResourceConflict < FormShuiError;    end # 409 Conflict
  class ResourceGone < FormShuiError;        end # 410 Gone
  class UnprocessableEntity < FormShuiError; end # 422 Unprocessable Entity
  class InternalServerError < FormShuiError; end # 500 Server Error
  class ServiceUnavailable < FormShuiError;  end # 503 Server Error
end
