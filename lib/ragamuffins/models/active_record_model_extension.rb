module Ragamuffins
  module ActiveRecordModelExtension
    extend ActiveSupport::Concern

    included do

      # Fetch all the deleted ids from the backend, and return them as an array
      #   Model.deleted_ids = []
      def self.show_deleted_ids(ids = [])
        return [] if ids == nil

        ids.collect{|s| s.to_i} - self.where("#{table_name}.id IN (?)", ids).map(&:id)
      end
    end
  end
end
