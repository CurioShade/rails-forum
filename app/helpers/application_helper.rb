module ApplicationHelper
    # Returns string representing url path without query parameters
    def url_clean_path
        request.fullpath.sub("?" + request.query_string, "")
    end

    # Renders appropriate html tags for pager partial
    def render_pager_element(image, page=1)
        clamped_page = page.clamp(1, @page_limit)
        page_param = "?page=#{page}"
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
end
