trigger Test23 on Contact (after update) {
     list<ID> vsx=new list<Id>();
    for(contact ast:trigger.new)
    {
        vsx.add(ast.AccountId);
    }
    list<Account> acc=[select id,DunsNumber,website from Account where id in:vsx];
    acc[0].website=acc[0].website+'Divyapatil.com';
    update acc;
}