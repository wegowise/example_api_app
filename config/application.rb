require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)


module ExampleApiApp
  class Application < Rails::Application
    config.time_zone = 'Eastern Time (US & Canada)'
    config.i18n.default_locale = :en

    config.after_initialize do
      require Rails.root.join('lib/wegowise_client')
    end
  end
end
