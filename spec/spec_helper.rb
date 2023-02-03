if ENV['SIMPLECOV'] == 'true'
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_filter 'spec'
  end
end

RSpec.configure do |config|
  Dir["./spec/support/**/*.rb"].sort.each { |f| require f}
end
  