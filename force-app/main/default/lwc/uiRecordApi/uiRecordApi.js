import { LightningElement, wire } from 'lwc';
import { getListUi } from 'lightning/uiListApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account'
import NAME_FIELD from "@salesforce/schema/Account.Name";
export default class UiRecordApi extends LightningElement {
    accResult;
    accId;
    error;

    handleKeyChange(event){
        this.accId = event.detail.Id;
        //alert('Account is crerated '+  this.accResult);

    }

    @wire(getListUi, { objectApiName: ACCOUNT_OBJECT, listViewApiName:'AllAccounts' })


                wiredListView({error, data}){
                    if(data){
                        console.log(data);
                        this.accResult = data.records.records;

                    }else if (error) {
                        this.error = error;
                        console.log(  this.error);
                        this.accResult = this.error;
                    }
                }
            


    /*
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
      alert('Error: '+error.body.message);
			this.accounts = undefined;
		})
	} 
    
    */
}