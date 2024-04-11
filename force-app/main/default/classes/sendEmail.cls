public with sharing class sendEmail {

    ApexPages.StandardController controller;

    public sendEmail(ApexPages.StandardController controller) {
        this.controller = controller;
    }

    public PageReference sendEmail() {
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.setTemplateId('00X30000000h4jF');
        message.setTargetObjectId(controller.getId());
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { message });
        return controller.view();
    }

}