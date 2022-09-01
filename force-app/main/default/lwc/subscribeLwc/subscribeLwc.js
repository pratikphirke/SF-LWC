import { LightningElement } from 'lwc';
import { createMessageContext, subscribe, unsubscribe } from 'lightning/messageService';
import textMessageChannel from "@salesforce/messageChannel/TextMessageChannel__c";
export default class SubscribeLwc extends LightningElement {
    receivedMessage = "";
    context = createMessageContext();
    objSubscription = null;
    // Call subscribe or unsubscribe based on the input toggle value.
    toggleSubscribe(event){
        if(event.target.checked){
            this.subscribeToTextMessage();
        }else{
            this.unsubscribeToTextMessage();
        }
    }
    // To subscribe to message channel.
    subscribeToTextMessage(){
        if (this.subscription) {
            return;
        }
        this.subscription = subscribe(this.context, textMessageChannel, (message) => {
            this.handleMessage(message);
        });
    }
    // TO set the received message.
    handleMessage(message) {
        this.receivedMessage = message.publishedText;
    }
    
    // To unsubscribe from the message channel.
    unsubscribeToTextMessage() {
        unsubscribe(this.subscription);
        this.subscription = null;
    }
}