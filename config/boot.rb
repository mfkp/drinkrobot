#require 'rubygems'
#if File.exist?(File.expand_path('../../Gemfile', __FILE__))
#  require 'bundler'
#  Bundler.setup
#end

# This configuration will work on heroku (16.04.2010)
# congig/boot.rb (rails3 app) or config/preinitializer.rb (rails 2.3.5 app)

# Use locked gems if present.
begin
  require File.expand_path('../../.bundle/environment', __FILE__)

rescue LoadError
  # Otherwise, use RubyGems.
  require 'rubygems'

  # And set up the gems listed in the Gemfile.
  if File.exist?(File.expand_path('../../Gemfile', __FILE__))
    require 'bundler'
    Bundler.setup
  end
end

