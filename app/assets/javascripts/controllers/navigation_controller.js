import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["menu", "iconOpen", "iconClose"]

  toggleMenu() {
    const menuTarget = this.menuTarget;
    const iconOpenTarget = this.iconOpenTarget;
    const iconCloseTarget = this.iconCloseTarget;

    if (menuTarget.classList.contains("hidden")) {
      menuTarget.classList.remove("hidden");
      menuTarget.classList.add("block");
      iconOpenTarget.classList.remove("hidden");
      iconCloseTarget.classList.add("hidden");
    } else {
      menuTarget.classList.remove("block");
      menuTarget.classList.add("hidden");
      iconOpenTarget.classList.add("hidden");
      iconCloseTarget.classList.remove("hidden");
    }
  }
}
