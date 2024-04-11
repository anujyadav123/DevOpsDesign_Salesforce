public without sharing class quizcontroller {
    @AuraEnabled
    public static void createtaker(string passworde){
    Quiz_taker__c abc=new Quiz_taker__c();
        abc.Name=passworde;
        insert abc;
        
    }
    @AuraEnabled
    public static void generatescore(string taker,string response,string qustion){
        List<Quiz_Questions__c> zas=[select id,Correct_One__c,Question__c from Quiz_Questions__c where Question__c=:qustion limit 1];
        if(response==zas[0].Correct_One__c)
        {list<Quiz_taker__c> abc=[select id,Quiz_ans__c from Quiz_taker__c where Name=:taker limit 1];
         abc[0].Quiz_ans__c=abc[0].Quiz_ans__c+100;
         update abc[0];
        }
        
        
    }
    @AuraEnabled(cacheable=true)
    public static list<Quiz_taker__c> getlboard(){
        
        list<Quiz_taker__c> vcz=[select Name,Quiz_ans__c from Quiz_taker__c];
        return vcz;
    }
    @AuraEnabled(cacheable=true)
    public static List<Quiz_Questions__c> getquestionlist(){
    	List<Quiz_Questions__c> qustionlist=[select Question__c,Option_A__c,Option_B__c,Option_C__c,Option_D__c,Correct_One__c from Quiz_Questions__c limit 15];
        return qustionlist;
    }

}