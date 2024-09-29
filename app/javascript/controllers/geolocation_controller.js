import { Controller } from "@hotwired/stimulus"
import { getDistance, convertDistance } from "geolib";
import { isEmpty } from 'lodash-es';

export default class extends Controller {
  static targets = [ 'property' ];

  connect (){
    if (isEmpty(this.element.dataset.latitude) && isEmpty(this.element.dataset.longitude)){
      window.navigator.geolocation.getCurrentPosition((position) => {
        this.setUserCoordinates(position.coords);

        this.setDistanceText();
      });
    } else {
      this.setDistanceText();
    }
  }

  setUserCoordinates(coordinates){
    this.element.dataset.latitude = coordinates.latitude;
    this.element.dataset.longitude = coordinates.longitude;
  }

  getUserCoordinates(){
    return {
      latitude: this.element.dataset.latitude,
      longitude: this.element.dataset.longitude
    };
  }

  setDistanceText() {
    this.propertyTargets.forEach((propertyTarget) => {
      const distance = getDistance(
        this.getUserCoordinates(),
        { latitude: propertyTarget.dataset.latitude, longitude: propertyTarget.dataset.longitude }
      );

      const converted_distance = Math.ceil(convertDistance(distance, "km"));

      propertyTarget.querySelector('[data-distance-away]').innerHTML = `${converted_distance} kilometers away`
    });
  }
}