import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mobile-menu"
export default class extends Controller {
  static targets = ["toggle", "menu"]

  connect() {
    this.setBodyPadding()
    window.addEventListener("resize", this.setBodyPadding)
  }

  disconnect() {
    window.removeEventListener("resize", this.setBodyPadding)
  }

  toggleMenu() {
    this.menuTarget.classList.toggle("hidden")
  }

  // Arrow function to keep `this` context
  setBodyPadding = () => {
    const isMobile = window.innerWidth < 640
    document.body.style.paddingTop = isMobile ? "8rem" : "0"
  }
}
