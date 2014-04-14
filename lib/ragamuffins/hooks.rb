module Ragamuffins
  class Hooks
    def self.init
      ActiveSupport.on_load(:active_record) do
        require 'ragamuffins/models/active_record_extension'
        ::ActiveRecord::Base.send :include, Ragamuffins::ActiveRecordExtension
      end
    end
  end
end
