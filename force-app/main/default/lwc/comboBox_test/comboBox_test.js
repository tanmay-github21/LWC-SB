import { LightningElement, wire, track} from 'lwc';
import getBoatTypes from '@salesforce/apex/BoatDataService.getBoatTypes';
export default class ComboBox_test extends LightningElement {
    selectedBoatTypeId=''; 
    error= undefined;
    @track searchOptions; 
    @wire(getBoatTypes)
    wire_boatTypes({data, error})
    {
        if(data)
        {
            console.log('Result', JSON.stringify(data)); 
            this.searchOptions= data.map(type=> { return{label:type.Name, value:type.Id}; });
            this.searchOptions.unshift({label:'All Types', value:''});
        }
        else if(error)
        {
            this.error=error; 
            this.searchOptions=undefined;
        }
    }
}    