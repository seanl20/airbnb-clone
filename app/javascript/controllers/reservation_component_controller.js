import { Controller } from "@hotwired/stimulus"
import { Datepicker } from "vanillajs-datepicker";

export default class extends Controller {
  static targets = ['checkin', 'checkout']
  connect(){
    console.log('Inside Reservation Component Controller');
    console.log('Datepicker: ', Datepicker);

    new Datepicker(this.checkinTarget);
    new Datepicker(this.checkoutTarget);
  }

}