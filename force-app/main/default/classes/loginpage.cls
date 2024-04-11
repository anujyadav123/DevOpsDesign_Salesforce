public without sharing class loginpage {
   
    @AuraEnabled
    public static boolean vcContact(string Email1,string password){
    List<Contact> conList =[Select id,Email,Password__c from Contact where Email=:Email1 and Password__c=:password];
       if(conList.size()>0)
        return true;
        else
           return false;
        
    }
    }