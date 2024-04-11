public interface TriggerHandler {
    
    
    void afterInsert(List<Contact> newRecords);
    void beforeInsert(List<Contact> newRecords);
}