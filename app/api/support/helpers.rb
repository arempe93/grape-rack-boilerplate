# frozen_string_literal: true

module API
  module Support
    module Helpers
      def set(params, include_missing: false)
        declared(params, include_parent_namespaces: false,
                         include_missing: include_missing)
      end

      def find(collection, query)
        collection.find_by(query).tap do |m|
          class_name = collection.respond_to?(:model) ? collection.model.name : collection
          not_found! "#{class_name} with query '#{query}' was not found" unless m
        end
      end

      def paginate(query, per_page: params[:per_page], page: params[:page])
        total_rows = query.unscope(:select).count

        present :total_rows, total_rows
        present :total_pages, (total_rows / per_page.to_f).ceil

        query.limit(per_page).offset((page - 1) * per_page)
      end

      def sort(query, sort_by: params[:sort_by], sort_direction: params[:sort_direction])
        # NOTE: not using hash syntax because AR will prefix the table name of
        #   the collection model (eg. users.last_name), and that could be undesired
        #   behavior (eg. joins)
        query.order("#{sort_by} #{sort_direction}")
      end
    end
  end
end
