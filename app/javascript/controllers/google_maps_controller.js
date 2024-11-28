import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['map', 'property'];

  connect() {
    this.mapTarget.style.height = '100%'

    const map = this.initMap(this.propertyTargets);
  }

  async initMap(properties) {
    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");

    const firstProperty = properties[0];
    const firstPosition = { lat: parseFloat(firstProperty.dataset.latitude), lng: parseFloat(firstProperty.dataset.longitude) }

    const map = new Map(this.mapTarget, {
      center: firstPosition,
      zoom: 8,
      mapId: "4504f8b37365c3d0"
    });

    properties.forEach((property) => {
      const position = { lat: parseFloat(property.dataset.latitude), lng: parseFloat(property.dataset.longitude) }

      const marker = new AdvancedMarkerElement({
        map,
        position: position
      });
    });
  }
}