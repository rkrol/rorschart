module Rorschart
  class Engine < ::Rails::Engine

    initializer "precompile", :group => :all do |app|
      # use a proc instead of a string
      app.config.assets.precompile << Proc.new{|path| path == "rorschart.js" }
      app.config.assets.precompile << Proc.new{|path| path == "rorschart.css" }
    end

    initializer "helper" do |app|
      ActiveSupport.on_load(:action_view) do
        include Helper
      end
    end

  end
end
