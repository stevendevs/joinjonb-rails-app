// mobile_menu_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    this.setInitialState()
  }

  toggleMenu() {
    this.menuTarget.classList.toggle("hidden")
  }

  setInitialState() {
    if (window.innerWidth >= 640) {
      this.menuTarget.classList.remove("hidden")
    } else {
      this.menuTarget.classList.add("hidden")
    }
  }
}
