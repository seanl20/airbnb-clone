import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {
  connect() {
    console.log("Enter:, ", enter);
    console.log("Leave:, ", leave);
    console.log("Toggle:, ", toggle);
  }
}
