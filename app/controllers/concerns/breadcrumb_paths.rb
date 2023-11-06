module BreadcrumbPaths
    extend ActiveSupport::Concern

    def prepare_breadcrumbs
        if params.has_key?(:id)
            model_name = params[:controller].chop
            path_title = instance_variable_get("@#{model_name}").title
            path = send("#{model_name}_path", params[:id].to_i)
            @breadcrumbs = [{name: path_title, content: path}]
            if params[:controller] == "posts"
                subject = Post.find(params[:id]).subject
                path = subject_path(subject)
                @breadcrumbs.unshift({name: subject.title, content: path})
            end
        end
    end
end