trigger AccountTrigger on Account (after insert, after update) {
    AccountTriggerHandler.runtrigger(trigger.new,trigger.oldmap,trigger.NewMap);

}