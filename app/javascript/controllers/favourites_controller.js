import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  favourite(){
    if ( this.element.dataset.favourited === "true"){
      this.element.dataset.favourited = "false"
      this.element.setAttribute('fill', '#CED4DA');
    } else {
      this.element.dataset.favourited = "true"
      this.element.setAttribute('fill', 'red');
    }
  }
}