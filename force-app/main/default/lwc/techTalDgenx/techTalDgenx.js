import { LightningElement,api} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import Tnav from '@salesforce/resourceUrl/Tnav';
import Av from '@salesforce/resourceUrl/Avatara';
import Name from '@salesforce/schema/Feedback__c.Name__c';
import feed from '@salesforce/schema/Feedback__c.Feedback__c';
import Wapp from '@salesforce/schema/Feedback__c';

export default class TechTalDgenx extends LightningElement {
    @api objName=Wapp;

    fields = [Name,feed];
    handleSuccess(event) {
     
      const evt = new ShowToastEvent({
          title: 'Feedback sucessfully Generated,Thanks for your feedback',
          message: 'Record ID: ' + event.detail.id,
          variant: 'success',
      });
      this.dispatchEvent(evt);
  }
    

    get tna(){
        return Tnav;
    }
    
    get ava()
    {
        return Av;
    }
    handleonclicj(){
        window.open('https://anujyadavpocorg-dev-ed.my.site.com/s', '_blank');
    }

}