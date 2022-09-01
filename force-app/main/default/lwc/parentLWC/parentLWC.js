import { api, LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class ParentLWC extends LightningElement {
   @api objectApiName;

    strContactName = '';

    // To call the child component method to add the Contact into the list.
    addContact(){
        const successToast = new ShowToastEvent({
            title : "Contact add Successfully",
            message : "Contact:  :"+this.strContactName,
            variant : 'info'
        });
        
        this.dispatchEvent(successToast);
        this.template.querySelector('c-child-l-w-c').addContactToList(this.strContactName); 
    }
   
    changeName(event){
        this.strContactName = event.target.value;
    }


   /* userDetails = [
        {
            name: 'John Doe',
            title: 'CEO & Founder',
            company: 'Harvard University, example',
            buttontext: 'Contact',
            imageUrl: 'https://www.w3schools.com/w3images/team1.jpg'
        },
        {
            name: 'Steve Smith',
            title: 'CEO & Founder',
            company: 'Standford University, example',
            buttontext: 'Contact',
            imageUrl: 'https://www.w3schools.com/w3images/team2.jpg'
        },
        {
            name: 'David Warner',
            title: 'CEO & Founder',
            company: 'Sydney University, example',
            buttontext: 'Contact',
            imageUrl: 'https://www.w3schools.com/w3images/team3.jpg'
        },
        {
            name: 'Peter Parker',
            title: 'CEO & Founder',
            company: 'Melbourne University, example',
            buttontext: 'Contact',
            imageUrl: 'https://www.w3schools.com/w3images/team4.jpg'
        }

    ]
*/

    /*selectedPlayer = null;
    navList = [
{
            id: 1,
            name: 'Virat Kohli',
            imgUrl:
                'https://www.cricbuzz.com/a/img/v1/152x152/i1/c170661/virat-kohli.jpg',
            country: 'India',
            rating: '922',
            position: '1',
            selected: false
        },
        {
            id: 2,
            name: 'Steven Smith',
            imgUrl:
                'https://www.cricbuzz.com/a/img/v1/152x152/i1/c170624/steven-smith.jpg',
            country: 'Australia',
            rating: '913',
            position: '2',
            selected: false
        }
    ];
    selectedNavHandler(event) {
        const playerName = event.detail;
        this.selectedPlayer = this.navList.find(
            item => item.name === playerName
        );
    }

*/

   /* @track progressValue = 0;
    hanldeProgressValueChange(event) {
      this.progressValue = event.detail;
    }------------------------------------------------------------------------------------------*/
  
   /* @track childValue;
 
    constructor() {//child-> parent using customEvent
        super();   
        this.template.addEventListener('mycustomevent', this.handleCustomEvent.bind(this));
    }
    handleCustomEvent(event) {
        console.log('Event=>'+event.detail);
        this.childValue = event.detail;
        
    }*/

   
}