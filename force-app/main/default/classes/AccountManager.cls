@restresource(urlmapping='/Accounts/*')
global with sharing class AccountManager {
    
    @httpget
    global static Account getAccount(){
        RestRequest Request=RestContext.Request;
        string AccountId=Request.RequestURI.substring(Request.RequestURI.lastindexof('/')+1);
        system.debug('AccountId'+AccountId);
        Account Accnt=[select id,Name,(select Name from Contacts) from Account where id=:AccountId];
        return Accnt;
        
    }
    @httppost 
    global static Response Createlog(){
              //system.check
        RestRequest Request=RestContext.Request;
        Response Res=new Response();
        try{
            string logresponse= Request.Requestbody.tostring();
            integer sizeofRespone=logresponse.length();
            if(sizeofRespone > 13000)
            {
               logresponse='<-------Limit size exceeded for the Field------->';
            }
            Integration_Log__c ILG=new Integration_Log__c();
            ILG.Apex_Class_Name__c='Account Manager';
            ILG.IP_Address__c=Request.RemoteAddress;
            ILG.Response__c=logresponse;
            insert ILG;
            res.status=True;
          res.msg='RecordInserted';
        }
        catch(Exception e)
        {
          res.status=False;
          res.msg=e.getmessage();
        }
        
      Return Res;

    }
    global class Response{
        Boolean status;
        string msg;
    }

}