ENV['RACK_ENV'] = 'test'
require File.expand_path('../../config/boot', __FILE__)

ActiveRecord::Migration.maintain_test_schema!

Dir[File.dirname(__FILE__) + '/spec_helpers/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.include FactoryBot::Syntax::Methods

  config.include Rack::Test::Methods, type: :request, file_path: %r{spec/api}
  config.include Support::Requests, file_path: %r{spec/api}

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    if example.metadata[:skip_db_cleaner]
      example.run
    else
      DatabaseCleaner.cleaning { example.run }
    end
  end
end
