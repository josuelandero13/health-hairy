import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "preview"];

  preview(event) {
    const input = this.inputTarget;
    const preview = this.previewTarget;
    let file = input.files[0];
    let reader = new FileReader();

    reader.onload = (fichero) => {
      preview.src = fichero.target.result;
    };

    if (file) {
      reader.readAsDataURL(file);
    } else {
      preview.src = "placeholder.png";
    }
  }
}
