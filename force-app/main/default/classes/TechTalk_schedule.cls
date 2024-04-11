public class TechTalk_schedule implements Schedulable{
    public void execute(SchedulableContext sc){
        List<account> acclst=new List<account>();
  List<account> acc=[select id,Tech_Talk_21_june__c,name from account];
        for(Account acc1:acc){
            acc1.Tech_Talk_21_june__c=True;
            acclst.add(acc1);
        }
        update acclst;
    }
}