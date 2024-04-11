import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import upContact from '@salesforce/apex/passwordcreation.updateContact';
var data = localStorage.getItem("object_name");
localStorage.clear(); 
var value1 = JSON.parse(data).id;
export default class Passwordcreation extends NavigationMixin(LightningElement) {
    code;
    
    
    handlePasswordChange(event){
        
       this.code = event.target.value;
       console.log("event.target.value-->>>",event.target.value);
    }
   
  
    handleLogin(event){
        

        if(this.code){
        
        event.preventDefault();
        
        upContact({password:this.code,conid:value1}).then((result)=>{
            alert('Password created successfully')
            
            
    })   
        }
    }
    
    
}