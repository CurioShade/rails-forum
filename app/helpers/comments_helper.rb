module CommentsHelper
    def comment_destroy_button(post, comment)
        button_to post_comment_path(post, comment), method: :delete,
        class: "exit-button" do
            image_tag "exit2.svg", size: "18x18"
        end
    end
end
