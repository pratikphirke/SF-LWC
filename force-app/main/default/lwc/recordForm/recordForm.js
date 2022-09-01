import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';

export default class RecordForm extends LightningElement {
    strRecordId;
    accountRecID;
    accountObject = ACCOUNT_OBJECT;
    arrayFields =[NAME_FIELD,PHONE_FIELD, TYPE_FIELD, WEBSITE_FIELD];
    
    handleAccountCreated(){
       alert('Account is crerated '+JSON.stringify(this.arrayFields));
    }
    handleSuccess(event){
        this.accountRecID = event.detail.id;
        alert('Account is crerated '+  this.accountRecID);

    }
}