require "spec_helper"

describe FormShui::Connection do

  before do
    @obj = Object.new
    @obj.extend FormShui::Connection
  end

  describe "#api_url" do

    it "should respond to api_url" do
      @obj.api_url.should == "http://promojam.dev:4567"
    end

    it "should be able to change api_url" do
      @obj.api_url = "http://promojam.test:4567"
      @obj.api_url.should == "http://promojam.test:4567"
    end

  end

  describe "#api_connection" do
    let(:options){ { url: @obj.api_url, ssl: { version: :TLSv1 } } }

    it "should create and cache a faraday connection" do
      conn = double(:connection)
      Faraday.should_receive(:new).with(options).and_return(conn)
      @obj.api_connection.should == conn
      Faraday.should_not_receive(:new).with(options)
      @obj.api_connection
    end

  end

end
