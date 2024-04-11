trigger testanuj123 on Contact (after insert,after delete) {
    List<ID> accobj= new List<ID>();
    integer i=0;
    integer j;
    for(Contact acc:trigger.new)
    {   
        accobj.add(acc.AccountId);
        i++;
    }
    list<Account> accobjj=[select id,Total_Contact__c from Account where id in:accobj];
    if(trigger.isInsert)
    accobjj[0].Total_Contact__c=i;
    else
     accobjj[0].Total_Contact__c=accobjj[0].Total_Contact__c-i;   
    update accobjj;
}