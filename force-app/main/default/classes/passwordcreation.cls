public without sharing class passwordcreation {
   
    @AuraEnabled
    public static string updateContact(string conid,string password){
    List<Contact> conList =[Select id from Contact where id=:conid limit 1];
       conList[0].Password__c=password;
        update conList[0];
        return 'true';
        
    }
    }