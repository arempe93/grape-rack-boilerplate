# frozen_string_literal: true

require 'pathname'
require 'active_support'

require_relative '../lib/tagged_timestamp_logger.rb'

class App
  class << self
    def env
      @env ||= ActiveSupport::StringInquirer.new(ENV['RACK_ENV'] || 'development')
    end

    def logger
      @logger ||= TaggedTimestampLogger.new("log/#{env}.log")
    end

    def root
      @root ||= Pathname.new(File.expand_path('..', File.dirname(__FILE__)))
    end

    def stack
      @stack ||= Rack::Builder.new do
        use RequestStore::Middleware
        use Middleware::RequestId
        use OTR::ActiveRecord::ConnectionManagement
        use OTR::ActiveRecord::QueryCache

        run ->(e) { API::Base.call(e) }
      end
    end
  end
end
