import { LightningElement, wire } from 'lwc';
import {subscribe, unsubscribe, APPLICATION_SCOPE, MessageContext} from 'lightning/messageService';
import BOATMC from '@salesforce/messageChannel/BoatMessageChannel__c';
export default class BoatSearch extends LightningElement {
    isLoading= false;
    handleLoading(){}
    handleDoneLoading(){}
    searchBoats(event){}
    createNewBoat(){}
}