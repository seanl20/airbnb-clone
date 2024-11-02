import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  submitButtonClass = 'mt-4 w-full bg-indigo-600 border border-transparent rounded-md shadow-sm py-3 px-4 text-base font-medium text-white';
  
  connect() {
    let submitButton = this.getStripeSubmitButton();

    submitButton.className += this.submitButtonClass;

    this.getStripeFormLabel().classList.add('hidden');

    this.getStripeCardElement().classList.add('mt-4');
  }

  getStripeSubmitButton(){
    return document.querySelector('#stripe-form input[type="submit"]');
  }

  getStripeFormLabel(){
    return document.querySelector('label[for="card_element"]');
  }

  getStripeCardElement(){
    return document.getElementById('card-element');
  }
}
