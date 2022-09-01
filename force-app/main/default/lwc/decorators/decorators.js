import { LightningElement,track } from 'lwc';
import getAccounts from'@salesforce/apex/AccountHelper.getAccounts';
export default class Decorators extends LightningElement {
  
 // @wire(getAccountList) accounts;

  @track greeting = '@Track Decorator';
    name= 'Pratik';
  changeHandler(event) {
    this.greeting = event.target.value;
  }
//--------------------------------------------------------
 /* @track searchKey;

   //Search Account @wire Decorator
  @wire (getAccounts,{strAccountName: '$searchKey'}) accounts;

    handleKeyChange(event){
      this.searchKey = event.target.value;
    }
*/
/*
  @track searchKey;
	@track accounts;
	@track error;

	@wire (getAccounts,{strAccountName: '$searchKey'})
    
  //Search Account Wired Function
	wiredAccounts({data, error}){
		if(data) {
			this.accounts =data;
			this.error = undefined;
		}else {
			this.accounts =undefined;
			this.error = error;
		}
	}

	handleKeyChange(event){
		this.searchKey = event.target.value;
	}*/


  //---------------Imperative call------------------------
  @track accounts;
	@track error;
	handleKeyChange(event){
		const searchKey = event.target.value;
    
		getAccounts({ strAccountName: searchKey })
		.then(result => {
			this.accounts = result;
    //  alert('Accounts: '+JSON.stringify(this.accounts));
			this.error = undefined;
		})
		.catch(error => {
			this.error = error;
    //  alert('Error: '+error.body.message);
			this.accounts = undefined;
		})
	} 

}