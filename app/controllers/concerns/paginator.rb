# Controller concern which adds simple variables for pagination
module Paginator
    extend ActiveSupport::Concern

    def set_pagination(record_limit, model)
        @page_limit = record_limit
        @page = params.has_key?(:page) ? params[:page].to_i : 1
        @record_id = model[@page_limit * (@page-1)]&.id
        max_pages = model.max_pages(@page_limit)
        unless max_pages > 0
            max_pages = 1
        end 

        if @page < 1 || @page > max_pages
            redirect_back_or_to url_clean_path
        end
    end
end