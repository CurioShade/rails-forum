class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    # Returns string representing url path without query parameters
    def url_clean_path
        request.fullpath.sub("?" + request.query_string, "")
    end

    private 

    def current_user
        @_current_user ||= session[:current_user_id] &&
        User.find_by(id: session[:current_user_id])
    end

    def logged_in?
        current_user != nil
    end
end
