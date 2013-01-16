require "spec_helper"

describe "FormShui" do

  describe "#enable_faraday_logger" do

    it "should insert faraday logging middleware" do
      FormShui.instance_variable_set("@api_connection", nil)
      conn = double(:connection)
      Faraday.should_receive(:new).with(url: FormShui.api_url).and_return(conn)
      conn.should_receive(:response).with(:logger)
      FormShui.enable_faraday_logger
    end

  end

end
