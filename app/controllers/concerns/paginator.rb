# Controller concern which adds simple variables for pagination
module Paginator
    extend ActiveSupport::Concern

    def set_pagination(record_limit, model)
        @page_limit = record_limit
        @page = params.has_key?(:page) ? params[:page].to_i : 1
        @record_id = model[@page_limit * (@page-1)]&.id

        if @page < 1 || @page > model.max_pages(@page_limit)
            redirect_back_or_to url_clean_path
        end
    end
end