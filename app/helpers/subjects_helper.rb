module SubjectsHelper
    def subject_attributes(render_turbo=true)
        html_options = {class: "content-item"}
        if render_turbo == false
            html_options[:data] = {turbo: false}
        end
        html_options
    end

    def subject_destroy_button(category, subject)
        button_to category_subject_path(category, subject), method: :delete, 
        class: "exit-button" do
            image_tag "exit2.svg", size: "20x20"
        end
    end
end
