require 'simplecov'
SimpleCov.start  do
  load_adapter 'test_frameworks'
  add_group 'FormShui', 'lib/form_shui'
  add_group 'Models', 'lib/form_shui/models'
  add_group 'Faraday Middleware', 'lib/faraday'
end

Dir[File.expand_path('../../lib/*.rb', __FILE__)].each{|f| require f}
Dir[File.expand_path('../../lib/models/*.rb', __FILE__)].each{|f| require f}
require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
  config.mock_with :rspec
  config.include WebMock::API
end

def a_delete(path)
  a_request(:delete, FormShui.api_url + path)
end

def a_get(path)
  a_request(:get, FormShui.api_url + path)
end

def a_post(path)
  a_request(:post, FormShui.api_url + path)
end

def a_put(path)
  a_request(:put, FormShui.api_url + path)
end

def stub_delete(path)
  stub_request(:delete, FormShui.api_url + path)
end

def stub_get(path)
  stub_request(:get, FormShui.api_url + path)
end

def stub_post(path)
  stub_request(:post, FormShui.api_url + path)
end

def stub_put(path)
  stub_request(:put, FormShui.api_url + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
