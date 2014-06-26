require "#{File.dirname(__FILE__)}/builder"

module Ace

  module Helper

    class Railtie < Rails::Railtie
      initializer "ace.builder" do
        ActionView::Base.send :include, Builder
      end
    end

  end

end
