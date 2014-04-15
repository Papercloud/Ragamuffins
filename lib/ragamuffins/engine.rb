module Ragamuffins #:nodoc:
  class Engine < ::Rails::Engine #:nodoc:
    # isolate_namespace Ragamuffins
    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
