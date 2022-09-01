import { LightningElement } from 'lwc';

export default class CustomToastNotificationParent extends LightningElement {

    sticky = false;
    timeout = 2000;
    showError() {
      this.template
        .querySelector("c-custom-toast-notification")
        .showToast("error", "This is an Error Message.");
    }
    showWarning() {
      this.template
        .querySelector("c-custom-toast-notification")
        .showToast("warning", "This is a Warning Message.");
    }
    showSuccess() {
      this.template
        .querySelector("c-custom-toast-notification")
        .showToast("success", "This is a Success Message.");
    }
    showInfo() {
      this.template
        .querySelector("c-custom-toast-notification")
        .showToast("info", "This is a Info Message.");
    }
}