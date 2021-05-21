source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker', '~> 2.18'
  gem 'pry', '~> 0.13.1'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'shoulda-matchers', '~> 4.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
