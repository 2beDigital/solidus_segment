module SolidusSegment
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('templates', __dir__)

      def copy_initializer_file
        copy_file "analytics_ruby.rb", "config/initializers/analytics_ruby.rb"
      end

      open('config/initializers/devise.rb', 'a') do |f|
        f << "\nWarden::Manager.after_set_user except: :fetch do |user, auth, opts|\n"
        f << "    Track::User.new(user, auth.request).logged_in\n"
        f << "end"
      end

      def include_trackers_helpers
        inject_into_file "app/helpers/application_helper.rb", "	include Spree::TrackersHelper\n", :before => /^end/
      end

    end
  end
end
