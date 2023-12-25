module CategoriesHelper
    def category_destroy_button(category)
        button_to category_path(category), method: :delete, 
        class: "exit-button" do
            image_tag "exit.svg", size: "14x14"
        end
    end
end
