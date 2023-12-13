import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    parentReference = this.element.parentElement;
    connect(){
        this.parentReference.classList.add("background-overlay")
    }
    disconnect(){
        this.parentReference.classList.remove("background-overlay")
    }
    closeModal(event) {
        event.preventDefault()
        this.disconnect()
        this.parentReference.removeAttribute("src")
        this.parentReference.removeAttribute("complete")
        this.element.remove()
    }
}