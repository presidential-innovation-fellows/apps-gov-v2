ENV["RAILS_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)

require "rspec/rails"
require "shoulda/matchers"
require "cancan/matchers"
require "paperclip/matchers"
require "draftsman/frameworks/rspec"

::Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
    with.library :active_model
  end
end

Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |file| require file }

module Features
  # Extend this module in spec/support/features/*.rb
  include Formulaic::Dsl
end

RSpec.configure do |config|
  config.include Features, type: :feature
  config.include Devise::TestHelpers, type: :controller
  config.include Paperclip::Shoulda::Matchers, type: :model
  config.include Warden::Test::Helpers, type: :feature

  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
end

include ActionDispatch::TestProcess

ActiveRecord::Migration.maintain_test_schema!
Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.allow_url("#{ENV['ALGOLIA_APP_ID'].downcase}-dsn.algolia.net")
  config.allow_url("#{ENV['ALGOLIA_APP_ID'].downcase}-1.algolianet.com")
  config.allow_url("#{ENV['ALGOLIA_APP_ID'].downcase}-2.algolianet.com")
end
