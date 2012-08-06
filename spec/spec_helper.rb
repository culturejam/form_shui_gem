require 'simplecov'
SimpleCov.start  do
  load_adapter 'test_frameworks'
end
RSpec.configure do |config|
  config.mock_with :rspec
end
