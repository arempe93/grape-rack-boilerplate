source 'https://rubygems.org'

FRAMEWORK_VERSION = '= 6.0.0.rc1'

# Configuration
gem 'activesupport', FRAMEWORK_VERSION
gem 'zeitwerk'

# Grape API
gem 'grape'
gem 'grape-entity'

# API Helpers
gem 'request_store'

# Rack CORS
gem 'rack-cors', require: 'rack/cors'

# Swagger API doc
gem 'grape-swagger'
gem 'grape-swagger-entity'

# Enums
# gem 'enumerate_it'

# Global configs
gem 'global'

# Database
gem 'activerecord', FRAMEWORK_VERSION
gem 'activemodel', FRAMEWORK_VERSION
gem 'otr-activerecord'
gem 'mysql2', '~> 0.5'

# Authentication
gem 'bcrypt'
gem 'jwt'

# Background Jobs
# gem 'redis'
# gem 'sidekiq'
# gem 'sinatra', require: false

# Sever
gem 'puma'

group :development, :test do
  # Linting
  gem 'rubocop'

  # Testing
  gem 'rspec'
  gem 'rack-test'

  # Environment bootstrap
  # gem 'dotenv-rails'

  # Spring
  gem 'spring'

  # Model Annotations
  gem 'annotate'

  # Seeding information
  gem 'faker'
end

group :test do
  # Model factories
  gem 'factory_bot'

  # Database transaction cleaning
  gem 'database_cleaner'
end
