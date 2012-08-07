module FormShui
  class FormShuiError < StandardError
  end

  # 400 Bad Request
  class BadRequest < FormShuiError
  end

  # 401 Unauthorized
  class UnauthorizedAccess < FormShuiError
  end

  # 403 Forbidden
  class ForbiddenAccess < FormShuiError
  end

  # 404 Not Found
  class ResourceNotFound < FormShuiError
  end

  # 409 Conflict
  class ResourceConflict < FormShuiError
  end

  # 410 Gone
  class ResourceGone < FormShuiError
  end

  # 500 Server Error
  class InternalServerError < FormShuiError
  end

  # 503 Server Error
  class ServiceUnavailable < FormShuiError
  end
end
