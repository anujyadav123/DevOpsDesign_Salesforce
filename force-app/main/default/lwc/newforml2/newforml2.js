import { LightningElement, api } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ID_FIELD from '@salesforce/schema/Contact.Id';



export default class Newforml2 extends LightningElement {
    @api recordId;
    
   handleSuccess(event) {
        this.dispatchEvent(
            new ShowToastEvent({
                      title: 'Creation of data',
                      message: 'Your response has been saved sucessfully',
                      variant: 'success',
                      mode: 'dismissable'
                  })
         );}
              

         get acceptedFormats() {
             return ['.pdf', '.png','.jpg','.jpeg'];
         }
         handleUploadFinished(event) {
             // Get the list of uploaded files
             const uploadedFiles = event.detail.files;
             let uploadedFileNames = '';
             for(let i = 0; i < uploadedFiles.length; i++) {
                 uploadedFileNames += uploadedFiles[i].name + ', ';
             }
             this.dispatchEvent(
                 new ShowToastEvent({
                     title: 'Success',
                     message: uploadedFiles.length + ' Files uploaded Successfully: ' + uploadedFileNames,
                     variant: 'success',
                 }),
             );
         } 

       
   
         
         
}