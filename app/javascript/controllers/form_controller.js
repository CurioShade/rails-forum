import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    parentReference = this.element.parentElement;
    closeForm(event) {
        event.preventDefault()
        this.parentReference.removeAttribute("src")
        this.parentReference.removeAttribute("complete")
        this.element.remove()
    }
}