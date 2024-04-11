import { LightningElement,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import Name from '@salesforce/schema/WhatsappMessage__c.Name__c';
import Wapp from '@salesforce/schema/WhatsappMessage__c';
import Email from '@salesforce/schema/WhatsappMessage__c.Email__c';
import Message	 from '@salesforce/schema/WhatsappMessage__c.Message__c';
import navImage from '@salesforce/resourceUrl/NavImages';
import imageforp from '@salesforce/resourceUrl/imageforp';
import whats from '@salesforce/resourceUrl/Wapp';
import MyFile from '@salesforce/resourceUrl/AnujResume';
import Cert from '@salesforce/resourceUrl/cert';
export default class MainPage extends LightningElement {
   @api objName=Wapp;

    fields = [Name,Email,Message];
    handleSuccess(event) {
     
      const evt = new ShowToastEvent({
          title: 'Whatsapp Message Sent to Anuj',
          message: 'Record ID: ' + event.detail.id,
          variant: 'success',
      });
      this.dispatchEvent(evt);
  }
    
   downloadResume() {
      // Constructing the URL for the imported file
      const url = MyFile;

      // Creating an anchor element to trigger the download
      const link = document.createElement('a');
      link.href = url;
      link.download = 'AnujYadav_Resume.pdf'; // Change this to the actual file name and extension

      // Appending the anchor element to the body and clicking it
      document.body.appendChild(link);
      link.click();

      // Removing the anchor element from the body
      document.body.removeChild(link);
  }

    // Propert 
     get getNavImages()
     {
        return navImage;
     }
     get getc()
     {
        return Cert;
     }
      
     get image2(){
        return imageforp;
     }

     get wimg()
     {
        return whats;
     }
}