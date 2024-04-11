public without sharing class ContactTriggerHelper {
    public ContactTriggerHelper() {
        System.debug('Inside ContactTriggerHelper Constructor');
    }
    public void doTask1(list<Contact> jsb) {
        
    list<Student__c> vsx=new list<Student__c>();
        for(Contact a:jsb)
        {   Student__c dsa=new Student__c();
         
            dsa.Father_Name__c=a.FirstName;
         vsx.add(dsa);
        }
        insert vsx;
    }
    public void doTask2(list<Contact> jsb) {
        
    list<Student__c> vsx=new list<Student__c>();
        for(Contact a:jsb)
        {   Student__c dsa=new Student__c();
         
            dsa.Father_Name__c=a.FirstName;
         vsx.add(dsa);
        }
        insert vsx;
    }
    
}