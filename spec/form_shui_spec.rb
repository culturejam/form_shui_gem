require "spec_helper"
describe "FormShui" do
  describe "connection" do
    it "should respond to api_url" do
      FormShui.should respond_to :api_url
    end

    it "should be able to change api_url" do
      FormShui.api_url = "http://promojam.test:4567"
      FormShui.api_url.should == "http://promojam.test:4567"
    end
  end
end
