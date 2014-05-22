module Ragamuffins
  module ActiveRecordModelExtension
    extend ActiveSupport::Concern

    included do
      # self.send(:include, Ragamuffins::ConfigurationMethods)

      # Fetch all the deleted ids from the backend, and return them as an array
      #   Model.delted_ids = []
      eval <<-RUBY
        def self.show_deleted_ids(ids = [])
          return [] if ids == nil

          ids.collect{|s| s.to_i} - self.where("#{table_name}.id IN (?)", ids).map(&:id)
        end
      RUBY
    end
  end
end
