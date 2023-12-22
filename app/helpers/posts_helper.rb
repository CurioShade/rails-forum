module PostsHelper
    def post_destroy_button(subject, post)
        button_to subject_post_path(subject, post), method: :delete,
        class: "exit-button" do
            image_tag "exit2.svg", size: "18x18"
        end
    end
end
