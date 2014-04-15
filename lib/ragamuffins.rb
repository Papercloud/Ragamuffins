module Ragamuffins
end

# load Rails/Railtie
begin
  require 'rails'
rescue LoadError
  #do nothing
end

# Load All the stuff we need
require 'ragamuffins/hooks'
require 'ragamuffins/engine'

# if not using Railtie, call `Ragamuffins::Hooks.init` directly
if defined? Rails
  require 'ragamuffins/railtie'
end
