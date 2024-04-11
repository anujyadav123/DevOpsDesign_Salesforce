trigger poconcontact on Contact (after insert) {
if (trigger_poc__mdt.getInstance('Run_all_Triggers')?.Value__c== true) {
        TriggerHandler handler = new ContactTriggerHandler(Trigger.isExecuting, Trigger.size);
    
                 handler.afterInsert(Trigger.new);
            
    }}