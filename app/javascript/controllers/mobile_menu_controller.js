import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mobile-menu"
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
