import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  visit(event) {
    // Don't trigger if clicking on a link or button
    if (event.target.closest('a, button')) return

    // Navigate to the URL
    window.location.href = this.urlValue
  }
} 