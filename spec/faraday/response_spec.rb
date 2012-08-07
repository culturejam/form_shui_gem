require "spec_helper"

describe Faraday::Response do

  {
    400 => FormShui::BadRequest,
    401 => FormShui::UnauthorizedAccess,
    403 => FormShui::ForbiddenAccess,
    404 => FormShui::NotFound,
    500 => FormShui::InternalServerError,
    503 => FormShui::ServiceUnavailable
  }.each do |status, exception|
    describe "when HTTP status is #{status}" do

      before do
        stub_get('/forms').
          to_return(:status => status)
      end

      it "should raise #{exception.name} error" do
        lambda do
          FormShui::Form.all
        end.should raise_error(exception)
      end

    end
  end

end
