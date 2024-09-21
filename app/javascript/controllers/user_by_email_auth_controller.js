import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['email', 'submit'];

  connect(){
    this.submitTarget.addEventListener('click', (e) => {
      e.preventDefault();

      if (this.emailTarget.value.length === 0){
        console.log("email field empty");
        // email field is empty, so don't do anything
      } else {
        console.log("email field not empty");
        // email field is filled out, so do something
      }
    });
  }
}