import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = { x: Number, y: Number, data: Array }

  connect() {
    let xMap = 51.505
    let yMap = -0.09

    if ((this.xValue != "") && (this.yValue != "")) {
      xMap = this.xValue
      yMap = this.yValue
    }

    this.map = L.map('map').setView([xMap, yMap], 13);
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
      attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(this.map);
    
    if (this.hasDataValue) {
      this.dataValue.forEach(value => {
        let item = JSON.parse(value)
        L.marker([item.x, item.y]).addTo(this.map)
          .bindPopup(item.popupMessage)
          .openPopup();
      })
    }
  }
}