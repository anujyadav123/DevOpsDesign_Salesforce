import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getContact from '@salesforce/apex/authentication.getContact';

export default class Authentication extends NavigationMixin(LightningElement) {
    code;
    handlePasswordChange(event){
        
       this.code = event.target.value;
       console.log("event.target.value-->>>",event.target.value);
    }
  
    handleLogin(event){
        const urlParams = new URLSearchParams(window.location.search);
        console.log('urlparam'+urlParams);

        const conid = urlParams.get('id');
        console.log('urlparam123'+conid);
        if(this.code && urlParams){
            console.log("at line 21", conid)
          event.preventDefault();
        
        getContact({code:this.code,conid}).then((result)=>{
            
            console.log("at line 21", result)
            if(result==true){
             
                
                this[NavigationMixin.Navigate]({
                    type: 'comm__namedPage',
                    attributes: {
                        name: 'sucess_scrreen__c'
                    }
                    // state: {
                    //     emailParameter: 'email@email.com'
                    // }
                });

                
            }
            else{
                alert('Wrong Code')
            }
            var data = {id:conid};
            console.log("aks",data);
            localStorage.setItem("object_name",JSON.stringify(data));
    }).catch((error) => {
        this.error = error;      
        this.errorCheck = true;
        this.errorMessage = error.body.message;
    }); 
        }
    }
    
    
}