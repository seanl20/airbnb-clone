import { Controller } from "@hotwired/stimulus"

export default class extends Controller { 
  connect(){
  }

  copyLink() {
    navigator.clipboard.writeText(this.element.dataset.shareUrl);
  }
}