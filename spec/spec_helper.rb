if ENV['SIMPLECOV'] == 'true'
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_filter 'spec'
  end
end
  