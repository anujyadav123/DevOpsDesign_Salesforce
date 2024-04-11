trigger test3 on Student__c (After insert,After update) {
    
    //list<Account> accobj=new list<Account>();
    for(Student__c acc:trigger.New)
    {   string a='asd';
        acc.Father_Name__c='acc.BillingCity';
        update acc;
    }
    
    

}