require 'rails'
require File.dirname(__FILE__) + '/../../../../app/helpers/bootstrap_helper'

module Qrious
  module Ui
    # All we’re doing here is declaring the gem as an engine.
    # This will cause rails to add its directories to the load path when the gem is required.
    module Rails
      class Engine < ::Rails::Engine
        # vendor/assets/components is magically added to app.config.assets.paths
        # Because its under vendor/assets?
        #initializer "qrious-ui.assets.paths" do |app|
        #  #app.config.assets.paths << ::Qrious::Ui::Rails::Engine.root.join('vendor', 'assets', 'components')
        #end

        ## http://wondible.com/2011/12/23/give-rails-autoloading-a-boot-to-the-head/
        #initializer 'qrious-ui.autoload', :before => :set_autoload_paths do |app|
        #  puts "::Qrious::Ui::Rails::Engine.root=", ::Qrious::Ui::Rails::Engine.root
        #  app.config.autoload_paths << ::Qrious::Ui::Rails::Engine.root.join('lib')
        #  puts app.config.autoload_paths
        #end

        initializer "qrious-ui.assets.precompile" do |app|
          app.config.assets.precompile += font_awesome_fonts
        end

        initializer 'qrious-ui.setup_helpers' do |app|
          app.config.to_prepare do
            #ActionController::Base.send :helper, ::Qrious::Ui::Helpers::Bootstrap
            # All helpers are defined in app/helpers directory to be auto-reloaded on each request in dev env
            ActionController::Base.send :helper, BootstrapHelper
            ActionController::Base.send :helper, AngularHelper
          end
        end

        private

        def font_awesome_fonts
          components_dir = self.root.join('vendor', 'assets', 'components')
          Dir["#{components_dir}/font-awesome/font/fontawesome-webfont.*"].map{|f| f.gsub("#{components_dir}/", '')}
        end
      end
    end
  end
end
