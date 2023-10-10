# Controller concern which adds simple variables for pagination
module Paginator
    extend ActiveSupport::Concern
    def set_pagination
        @page_limit = params.has_key?(:record_limit) ? params[:record_limit] : 5
        @record_id = params.has_key?(:start) ? params[:start] : 1
    end
end