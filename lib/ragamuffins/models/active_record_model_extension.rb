module Ragamuffins
  module ActiveRecordModelExtension
    extend ActiveSupport::Concern

    included do

      # Fetch all the deleted ids from the backend, and return them as an array
      #   Model.deleted_ids = []
      def self.show_deleted_ids(ids = [])
        return [] if ids == nil || ids.empty?
        # Because params are always strings, we double check that (the first to_s) and then make sure that we convert the ids to a string as well
        # This allows us to make sure that we can handle UUIDs as well.
        ids.collect{|s| s.to_s} - self.where("#{table_name}.id IN (?)", ids).pluck(:id).map(&:to_s)

        #
        # if we were passed some ids that forms a bad query,
        # just return them all as deleted instead of causing a 500.
        # for example using "asdf" as an id.
        rescue ActiveRecord::StatementInvalid
          ids
      end
    end
  end
end
