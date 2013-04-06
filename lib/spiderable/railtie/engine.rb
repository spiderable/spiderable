require 'spiderable/railtie/middleware'

module Hashbang
  module Railtie
    class Engine < Rails::Engine
      initializer "application_controller.initialize_spiderable" do |app|
        if ['development', 'production'].include?(Rails.env)
          app.config.middleware.use "Spiderable::Railtie::Middleware"
        end
      end

      rake_tasks do
        Dir[File.expand_path('../../tasks/*.rake',  __FILE__)].each { |f| load f }
      end
    end
  end
end