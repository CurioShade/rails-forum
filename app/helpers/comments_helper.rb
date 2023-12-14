module CommentsHelper
    def comment_model_scope(model)
        if model.is_a? Array
            model
        else
            [model, model.comments.build]
        end
    end
end
