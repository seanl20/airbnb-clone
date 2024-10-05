import { Controller } from "@hotwired/stimulus"
import axios from 'axios';

export default class extends Controller {

  favourite(){
    if (this.element.dataset.userLoggedIn === "false") {
      return document.querySelector('[data-header-target="userAuthLink"]').click();
    }

    if ( this.element.dataset.favourited === "true"){
      axios.delete(this.element.dataset.unfavouriteUrl, {
        headers: { 
          'ACCEPT': 'application/json'
        }
      })
      .then((response) => {
        this.element.dataset.favourited = "false"
        this.element.setAttribute('fill', '#CED4DA');
      });
    } else {
      axios.post(this.element.dataset.favouriteUrl, {
        user_id: this.element.dataset.userId,
        property_id: this.element.dataset.propertyId
      },{
        headers: { 
          'ACCEPT': 'application/json'
        }
      })
      .then((response) => {
        this.element.dataset.favourited = "true"
        this.element.setAttribute('fill', 'red');
      });
    }
  }
}