public without sharing class authentication {
   
    @AuraEnabled(cacheable=true)
    public static boolean getContact(string code,string conid){
    List<Contact> conList =[Select id,Authentication_code__c from Contact where Authentication_code__c=:code and id=:conid];
       
    if(ConList.size()>0)
        return true;
        else
            return false;
        
    }
    }