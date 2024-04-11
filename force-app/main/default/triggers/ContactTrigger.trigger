trigger ContactTrigger on Contact (before insert) {
   ContactTrigger1Handler.RunTrigger(Trigger.new);

}