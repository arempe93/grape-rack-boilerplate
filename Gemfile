source 'https://rubygems.org'

gem 'rails', '~> 5.1'

# Grape API
gem 'grape'
gem 'grape-entity'
gem 'grape-middleware-logger', github: 'arempe93/grape-middleware-logger'

# Rack CORS
gem 'rack-cors', require: 'rack/cors'

# Swagger API doc
gem 'grape-swagger'
gem 'grape-swagger-rails'
gem 'grape-swagger-entity'

# Enums
gem 'enumerate_it'

# Global configs
gem 'global'

# Database
gem 'mysql2', '~> 0.4.10'

group :development, :test do
  # Testing
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rack-test'

  # Spring
  gem 'spring'

  # Model Annotations
  gem 'annotate'

  # Seeding information
  gem 'faker'
end

group :test do
  # Model factories
  gem 'factory_girl_rails', '= 4.8.0'

  # Database transaction cleaning
  gem 'database_cleaner'
end
