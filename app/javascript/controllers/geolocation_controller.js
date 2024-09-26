import { Controller } from "@hotwired/stimulus"
import { getDistance, convertDistance } from "geolib";

export default class extends Controller {
  static targets = [];

  connect (){
    console.log("geolib: ", getDistance);
    window.navigator.geolocation.getCurrentPosition((position) => {
      this.element.dataset.latitude = position.coords.latitude;
      this.element.dataset.longitude = position.coords.longitude;

      const distance = getDistance(
        { latitude: position.coords.latitude, longitude: position.coords.longitude },
        { latitude: 39.5158825, longitude: -116.853722 }
      );

      const converted_distance = convertDistance(distance, "km");

      console.log(converted_distance);
    });
  }
}