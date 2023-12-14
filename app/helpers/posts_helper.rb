module PostsHelper
    def post_model_scope(model)
        if model.is_a? Array
            model
        else
            [model, model.posts.build]
        end
    end
end
