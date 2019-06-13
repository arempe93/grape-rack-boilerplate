# frozen_string_literal: true

task :console do
  require 'irb'
  require 'irb/completion'

  def app
    App.stack
  end

  def json
    JSON.parse(last_response.body, symbolize_names: true)
  end

  include Rack::Test::Methods

  puts "Loading #{App.env} environment with Grape mounted..."

  ARGV.clear
  IRB.start
end
