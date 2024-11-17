import { Controller } from "@hotwired/stimulus"
import axios from 'axios';

export default class extends Controller {
  HEADERS = { 'ACCEPT': 'application/json' }

  favourite(e){
    e.preventDefault();
    if (this.element.dataset.userLoggedIn === "false") {
      Turbo.visit('/users/sign_in')
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
      this.element.setAttribute('fill', this.element.dataset.unfavouritedColour);
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
      this.element.setAttribute('fill', this.element.dataset.favouritedColour);
    });
  }

  getFavouritePath() {
    return '/api/favourites';
  }
}