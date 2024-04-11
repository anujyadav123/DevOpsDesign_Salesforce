public class Techtalk_queue implements Queueable {
    public List<Account> accList ; 
    public Techtalk_queue(List<Account> accList){
        this.accList = accList ;  
    }
    public void execute(QueueableContext context) {
        for(Account acc :accList){
            // Update the Account Name 
            acc.Tech_Talk_21_june__c =True;
        }
        update accList;
    }
}