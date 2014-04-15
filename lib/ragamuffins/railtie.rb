module Ragamuffins
  class Railtie < ::Rails::Railtie #:nodoc:
    initializer 'ragamuffins' do |_app|
      Ragamuffins::Hooks.init
    end
  end
end
