import { LightningElement, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

import upContact from '@salesforce/apex/quizcontroller.createtaker';
 
export default class Quiz_p1 extends NavigationMixin(LightningElement) {
   @track code;
  
  
   abc(event){
      
      this.code = event.target.value;
      console.log("event.target.value-->>>",code);
   }
 
    abcd(event){
      
      if(this.code){
      //var a=this.code;
       event.preventDefault();
    
       upContact({passworde:this.code}).then((result)=>{
           
        
           alert('Get Ready')
           this[NavigationMixin.Navigate]({
               type: 'comm__namedPage',
               attributes: {
                   name: 'questionPage__c'
               }
               // state: {
               //     emailParameter: 'email@email.com'
               // }
           });
           var data ={id:this.code};
           console.log('anuj12',data);
           localStorage.setItem("object_name",JSON.stringify(data));
          
   }).catch((error) => {
       this.error = error;     
       this.errorCheck = true;
       this.errorMessage = error.body.message;
   });  
       }}
   }