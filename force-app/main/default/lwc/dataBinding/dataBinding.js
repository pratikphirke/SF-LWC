import { LightningElement, track } from 'lwc';

export default class DataBinding extends LightningElement {
     // Data flow in one direction from Controller(JS)->Template(HTML)
   @track greeting = 'SF Notes';
   // Exchange data from Controller(JS)<-->Template(HTML) and vice versa
    changeHandler(event) {
        this.greeting = event.target.value;
      }
}