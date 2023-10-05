source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'rails', '~> 6.1.4', '>= 6.1.4.4'

gem 'puma', '~> 5.0'

gem 'sass-rails', '>= 6'

gem 'webpacker', '~> 5.0'

gem 'turbolinks', '~> 5'

gem 'pg', '~> 1.3', '>= 1.3.1'

gem 'jbuilder', '~> 2.7'

gem 'email_validator', '~> 2.2', '>= 2.2.3'

gem 'bcrypt', '~> 3.1.7'

gem 'bootstrap', '~> 5.1.3'

gem  'jquery-rails'

gem 'redcarpet', '~> 3.5', '>= 3.5.1'

# gem 'redis', '~> 4.0'
# gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  #gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  gem 'pg', '~> 1.3', '>= 1.3.1'
  gem 'rails_12factor', '~> 0.0.3'
end