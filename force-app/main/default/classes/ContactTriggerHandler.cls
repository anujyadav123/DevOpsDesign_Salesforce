public without sharing class ContactTriggerHandler implements TriggerHandler {
    private boolean triggerIsExecuting;
    private integer triggerSize;
    public ContactTriggerHelper helper;
    public ContactTriggerHandler(boolean triggerIsExecuting, integer triggerSize) {
        this.triggerIsExecuting = triggerIsExecuting;
        this.triggerSize = triggerSize;
        this.helper = new ContactTriggerHelper();
    }
     public void afterInsert(List<Contact> newcontacts) {
         helper.doTask1(newcontacts);
        
         
    }
         public void beforeInsert(List<Contact> newcontacts) {
         helper.doTask2(newcontacts);
        
    }
}