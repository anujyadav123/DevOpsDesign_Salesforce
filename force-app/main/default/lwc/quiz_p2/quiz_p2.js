import { LightningElement, wire ,track} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getqus from '@salesforce/apex/quizcontroller.getquestionlist';
import gscore from '@salesforce/apex/quizcontroller.generatescore';
var dataa = localStorage.getItem("object_name");
localStorage.clear(); 

var value1 = JSON.parse(dataa).id;


export default class Quiz_p2 extends NavigationMixin(LightningElement) {


   
   @track loca;
   @track coka;
  @track quslist;
  
   
    @wire(getqus,{})
    wiredgetqus({ error, data }) {
        if (data) {
          console.log('-- data returned --');     
          console.log("data",data);
          this.quslist = data;
          
    
        } else if (error) {
          console.log("error",error);
        }
        

         
}
aa(event){
  this.loca=event.target.value;
  console.log("response",event.target.value);

}


  handleUpdate(event){
    if(this.loca){
   event.preventDefault();
    this.coka =event.target.value;
   console.log("qustion",this.coka);
    gscore({taker:value1,response:this.loca,qustion:this.coka}).then((result)=>{
      
         alert('Response Updated')
         console.log("response1",event.target.value);
         
         
         /*this[NavigationMixin.Navigate]({
             type: 'comm__namedPage',
             attributes: {
                 name: 'questionPage__c'
             }
             // state: {
             //     emailParameter: 'email@email.com'
             // }
         });*/
        
 }).catch((error) => {
  this.error = error;     
  this.errorCheck = true;
  this.errorMessage = error.body.message;
});
     }}

     cd(event)
{
  this[NavigationMixin.Navigate]({
    type: 'comm__namedPage',
    attributes: {
        name: 'lboard__c'
    }
    // state: {
    //     emailParameter: 'email@email.com'
    // }
}).catch((error) => {
  this.error = error;     
  this.errorCheck = true;
  this.errorMessage = error.body.message;
});
}

    }