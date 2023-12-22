module ApplicationHelper
    # Returns string representing url path without query parameters
    def url_clean_path
        request.fullpath.sub("?" + request.query_string, "")
    end

    # Renders appropriate html tags for pager partial
    def render_pager_element(image, max_pages, page=1)
        clamped_page = page.clamp(1, max_pages)
        page_param = "?page=#{clamped_page}"
        tag.a href: url_clean_path + "#{page_param if page > 1}", 
        class: "#{"hidden" if @page == clamped_page}" do
            image_tag("#{image}.svg", size: "16x16")
        end
    end

    # Renders exit button for the modal
    def modal_exit_button
        tag.button class: "exit-button", data: {action: "click->modal#closeModal"} do
            image_tag "exit.svg", size: "20x20"
        end
    end

    # Render exit button for the form
    def form_exit_button
        tag.button class: "exit-button", data: {action: "click->form#closeForm"} do
            image_tag "exit.svg", size: "18x18"
        end
    end

    # Returns custom turbo tag name for categories
    def category_turbo_name(category)
        "#{dom_id(category)}_subjects"
    end
end
