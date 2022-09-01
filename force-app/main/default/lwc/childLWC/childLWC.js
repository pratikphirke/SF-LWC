import { LightningElement,api,track } from 'lwc';

export default class ChildLWC extends LightningElement {






 handleChange(event) {
        event.preventDefault();
        const name = event.target.value;
        //child-> parent using customEvent
        const selectEvent = new CustomEvent('mycustomevent', {            detail: name ,bubbles: true
        });
      this.dispatchEvent(selectEvent);
    }





  /*  // Default list of Contacts.
  @track lstContacts = ["Weird Coder", "Red Devil", "Mystic Baba", "OneManArmy Baburao"];
    
  // This method will add new Contact into Contact list.
  @api
  addContactToList(strContactName){

      this.lstContacts.push(strContactName);
     
  }*/

 // @api userDetails;


   /* @api navList;
    handleNavSelection(event) {
        event.preventDefault();
        const selectEvent = new CustomEvent('selection', {
            detail: event.target.name
        });
        // Fire the custom event
        this.dispatchEvent(selectEvent);
    }
*/
    
    /*@api progressValue;

    handleChnage(event) {
      this.progressValue = event.target.value;
      // Creates the event with the data.
      const selectedEvent = new CustomEvent("progressvaluechange", {
        detail: this.progressValue
      });
  
      // Dispatches the event.
      this.dispatchEvent(selectedEvent);
    }------------------------------------------------------------------------------*/
  
  
}