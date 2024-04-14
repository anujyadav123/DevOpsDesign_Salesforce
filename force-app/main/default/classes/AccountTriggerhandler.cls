public  class AccountTriggerhandler{
    Public static void RunTrigger(List<Account> NewList,Map<id,Account> Oldmap,Map<id,Account> NewMap){
        
        if(trigger.isafter && trigger.IsUpdate)
        {
           // updatetaxrate(NewList,Oldmap);
            createContact(NewMap,OldMap);
        }
       
    }
    public static void updatetaxrate(List<Account> Newlist,Map<id,Account> oldmap){
       List<Account> taxableAccounts=new List<Account>(); 
        
        for(Account Accnt:Newlist)
        
        {
            if(accnt.BillingPostalCode!=oldmap.get(accnt.id).BillingPostalCode)
                taxableAccounts.add(accnt);
        }
        if(!taxableAccounts.isEmpty())
        calculateTax(JSON.Serialize(taxableAccounts));
        
    }
    public static void createContact(Map<id,Account> NewMap,Map<id,Account> Oldmap){
        set<id> accountids=new set<id>();
        map<id,contact> mapUpdates=new map<id,contact>();
        list<Contact> updatelist=new List<Contact>();
        for(Account accnt: NewMap.values())
        {  if(accnt.phone!=oldmap.get(accnt.id).phone)
            Accountids.add(accnt.id);
        }
        for(Contact con: [select id,Name,Accountid,Phone from Contact where Accountid in: Accountids])
        {
            string phone=Newmap.get(con.Accountid).phone;
            con.phone=phone;
            updatelist.add(con);
        }
        if(!updatelist.isEmpty())
            update  mapUpdates.values();
    }
     
     
    
    @future(callout=true)
    public static void calculateTax(String TaxableAccounts){
        List<Account> AccountList=(List<Account>)JSON.deserialize(taxableAccounts,List<Account>.class);
        for(Account accnt:AccountList){        
         
               requestbodywrapper jsonstring=new requestbodywrapper();
                jsonstring.city=accnt.BillingCity;
                jsonstring.state=accnt.BillingState;
                jsonstring.street=accnt.BillingStreet;
                jsonstring.zip=accnt.BillingPostalCode;
                HTTP http=new HTTP();
                httpRequest request=new httpRequest();
                httpResponse response=new httpResponse();
                request.setMethod('POST');
                request.setEndPoint('https://sales-tax-calculator.p.rapidapi.com/rates');
                request.setHeader('X-Rapidapi-Key','a6f2fadf97msh26a27c9faa77310p17ee52jsn0853394c5104');
                request.setHeader('X-Rapidapi-Host','sales-tax-calculator.p.rapidapi.com');
                request.setHeader('content-type', 'application/json');
                
              
                request.setBody(JSON.serialize(jsonstring));
                response=http.send(request);
                if(response.getstatuscode()==200)
                {Integration_Log__c ilg=new Integration_Log__c();
                 ilg.Response__c=response.getbody();
                 Map<String, Object> responseObject = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    
   
                 String tax = String.valueOf(responseObject.get('tax_rate'));
                 insert ilg;
                 Account accnto=new Account(id=accnt.id);
                 accnto.Tax__c=tax;
                 update accnto;
                }
                     
                    
                
            
          
        }
    }
    public class requestbodywrapper{
         string city ;
             string state;
                string street;
                   string zip;
    }
        
    
}