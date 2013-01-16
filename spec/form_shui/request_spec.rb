require "spec_helper"

describe FormShui::Request do

  let(:conn) { double(:connection) }

  describe "#initialize" do

    it "should validate configuration at initialization" do
      expect { FormShui::Request.new(conn, nil) }.to raise_error(FormShui::FormShuiError)
    end

    it "should validate configuration at initialization" do
      config = FormShui::Config.new
      expect { FormShui::Request.new(conn, config) }.to raise_error(FormShui::FormShuiError)
    end

  end

  describe "#get" do

    before do
      @conn = Faraday.new do |req|
        req.request :auth_hmac
        req.adapter :test do |stub|
          stub.get('/echo') do |env|
            posted_as = env[:request_headers]['Content-Type']
            [200, {'Content-Type' => posted_as}, env[:body]]
          end
        end
      end

      @config = FormShui::Config.new
      @config.hmac_access_id = "access_id"
      @config.hmac_secret = "secret"
    end

    it "should sign the request" do
      response = FormShui::Request.new(@conn, @config).get('/echo', {})
      signed?(response.env, "access_id", "secret").should be_true
    end

    protected

    def klass
      Faraday::Request::AuthHMAC
    end

    # Based on the `authenticated?` method in auth-hmac.
    # https://github.com/dnclabs/auth-hmac/blob/master/lib/auth-hmac.rb#L252
    def signed?(env, access_id, secret)
      auth  = klass.auth
      rx = Regexp.new("#{klass.options[:service_id]} ([^:]+):(.+)$")
      if md = rx.match(env[:request_headers][klass::AUTH_HEADER])
        access_key_id = md[1]
        hmac = md[2]
        !secret.nil? && hmac == auth.signature(env, secret)
      else
        false
      end
    end

  end

end
