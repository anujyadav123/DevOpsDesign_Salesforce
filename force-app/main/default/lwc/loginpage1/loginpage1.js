import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getContact from '@salesforce/apex/loginpage.vcContact';

export default class Loginpage1 extends NavigationMixin(LightningElement) {
    password;
    Email;
    handlePasswordChange(event){
        
       this.password = event.target.value;
       console.log("event.target.value-->>>",event.target.value);
    }
    handleUserNameChange(event){
        
        this.Email = event.target.value;
        console.log("event.target.value-->>>",event.target.value);
     }
    
    
    
    handleLogin(event){
        

        if(this.password && this.Email){
        
        event.preventDefault();
        
        getContact({Email1:this.Email,password:this.password}).then((result)=>{
            console.log("at line 21", result)
            if(result==true){
             
                
                this[NavigationMixin.Navigate]({
                    type: 'comm__namedPage',
                    attributes: {
                        name: 'june__c'
                    }
                    // state: {
                    //     emailParameter: 'email@email.com'
                    // }
                });
              
                
            }
            else{
                alert('Wrong password')
            }
    }).catch((error) => {
        this.error = error;      
        this.errorCheck = true;
        this.errorMessage = error.body.message;
    }); 
        }
    }
    
    
}