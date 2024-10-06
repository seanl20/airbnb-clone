import { Controller } from "@hotwired/stimulus"
import axios from 'axios';

export default class extends Controller {
  HEADERS = { 'ACCEPT': 'application/json' }

  favourite(){
    if (this.element.dataset.userLoggedIn === "false") {
      return document.querySelector('[data-header-target="userAuthLink"]').click();
    }

    if ( this.element.dataset.favourited === "true"){
      this.unfavouriteProperty();
    } else {
      this.favouriteProperty();
    }
  }

  unfavouriteProperty(){
    axios.delete(this.getUnfavouritePath(this.element.dataset.favouriteId), {
      headers: this.HEADERS
    })
    .then((response) => {
      this.element.dataset.favourited = "false"
      this.element.dataset.favouriteId = '';
      this.element.setAttribute('fill', '#CED4DA');
    });
  }

  getUnfavouritePath(favouriteId){
    return `/api/favourites/${favouriteId}`
  }

  favouriteProperty(){
    axios.post(this.getFavouritePath(), {
      user_id: this.element.dataset.userId,
      property_id: this.element.dataset.propertyId
    },{
      headers: this.HEADERS
    })
    .then((response) => {
      this.element.dataset.favourited = "true";
      this.element.dataset.favouriteId = response.data.id;
      this.element.setAttribute('fill', 'red');
    });
  }

  getFavouritePath() {
    return '/api/favourites';
  }
}