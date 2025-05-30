import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["text"]

  onHover() {
    this.textTarget.classList.remove("text-white/80")
    this.textTarget.classList.add("text-white")
  }

  onLeave() {
    this.textTarget.classList.remove("text-white")
    this.textTarget.classList.add("text-white/80")
  }
}
