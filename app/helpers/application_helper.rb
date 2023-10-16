module ApplicationHelper
    # Returns string representing url path without query parameters
    def url_clean_path
        request.fullpath.sub("?" + request.query_string, "")
    end
end
