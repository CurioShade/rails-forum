import { Application } from "@hotwired/stimulus"
import "../turbo_redirect"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
