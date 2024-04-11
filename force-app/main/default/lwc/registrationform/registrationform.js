import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import EMAIL from '@salesforce/schema/Contact.Email';
import PHONE from '@salesforce/schema/Contact.Phone';
import Percentage_in_HSC__c from '@salesforce/schema/Contact.Percentage_in_HSC__c';
import Percentage_In_Graduation__c from '@salesforce/schema/Contact.Percentage_In_Graduation__c';
import Date_For_Availivitliy__c from '@salesforce/schema/Contact.Date_For_Availivitliy__c';
import Programming_Language_Known__c from '@salesforce/schema/Contact.Programming_Language_Known__c';


export default class Registrationform extends LightningElement {
    objectName = CONTACT_OBJECT ;
    fieldList = [NAME_FIELD,EMAIL,PHONE,Percentage_in_HSC__c,Percentage_In_Graduation__c,Date_For_Availivitliy__c,Programming_Language_Known__c];
    handleNavigation() {
       
              
         
            this[NavigationMixin.Navigate]({
                type: 'standard__webpage',
                attributes: {
                   url:'https://anujyadav-developer-edition.na163.force.com/anujtempoaa/registrationform'
                }
                
            })
    }
    
}