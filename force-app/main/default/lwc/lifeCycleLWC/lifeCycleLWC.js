import { LightningElement } from 'lwc';

export default class LifeCycleLWC extends LightningElement {
    constructor(){
    	super();
        console.log('Constructor Called...');
    }

    connectedCallback(){
    	console.log('CONNECTED CALLBACK');
    }

    renderedCallback(){
    	console.log('RENDERED CALLBACK');
    }

    disconnectedCallback(){
    	console.log('DISCONNECTED CALLBACK');
    }
    errorCallback(){
    	console.log('ERROR CALLBACK');
    }
}