import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    x: Number,
    y: Number,
    data: String // Cambiado de Array a String
  }

  connect() {
    let xMap = 51.505
    let yMap = -0.09

    if (this.hasXValue && this.hasYValue) {
      xMap = this.xValue
      yMap = this.yValue
    }

    this.map = L.map('map').setView([xMap, yMap], 13)
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
      attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(this.map)

    if (this.hasDataValue) {
      let markers = []
      try {
        markers = JSON.parse(this.dataValue)
      } catch (e) {
        console.error("❌ Error parsing JSON from data-map-data-value:", this.dataValue)
        return
      }

      markers.forEach(item => {
        L.marker([item.x, item.y]).addTo(this.map)
          .bindPopup(item.popupMessage)
          .openPopup()
      })
    }
  }
}
