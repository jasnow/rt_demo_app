source "https://rubygems.org"

gem "rails", "7.2.0.beta2"
gem "sprockets-rails" # 12/27/2021: Needed for Rails 7.x.

gem "sqlite3", "~> 1.4"
gem "overcommit"
gem "brakeman"
gem 'webrick'

group :development do
  gem "dawnscanner", require: false
end

gem "standard", group: [:development, :test]
gem "ruby_audit"
gem "spektr"

group :test do
  gem "rails-controller-testing"
end

gem 'simplecov', require: false, group: :test
