require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Jstarner
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.assets.paths << Rails.root.join("app", "assets", "img")

    config.generators do | g |
      g.assets          false
      g.helper          false
      g.jbuilder        false
      g.stylesheets     false
      g.test_framework :rspec,
        view_specs:     false,
        request_specs:  false,
        routing_specs:  false
    end
  end
end
