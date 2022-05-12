source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'rails-i18n', '~> 6.0.0' # For 6.0.0 or higher

# Use postgresql as the database for Active Record
# gem 'pg', '>= 0.18', '< 2.0'
gem 'mysql2'

# Use Puma as the app server
gem 'puma', '~> 4.1'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'jwt', '~> 2.1'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# config
gem 'figaro', '~> 1.2'

# GraphQL
gem 'graphql', '~> 1.11', require: true
gem 'graphql-guard', '~> 2.0'
gem 'graphql-batch', '~> 0.4.3'

# graphiql tools
gem "graphiql-rails"
gem 'graphql_playground_rails', '~> 0.1.1'
gem "sprockets", '< 4'

# version
gem 'paper_trail', '~> 10.3'

# whenever
gem 'whenever', require: false

# gem 'aliyun-sdk', '~> 0.7'
gem 'activestorage-aliyun', '~> 1.0'
gem 'apollo_upload_server', '2.0.3'

# fav, like
gem 'action-store', '~> 0.4'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # deploy
  gem "capistrano", "~> 3.14", require: false
  gem "capistrano-rails", "~> 1.6", require: false
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
  gem 'capistrano-rvm'
  # gem 'capistrano-sidekiq'
  gem 'ed25519', '>= 1.2', '< 2.0'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'

  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'rubocop', require: false

  # model comment
  gem 'annotate'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
