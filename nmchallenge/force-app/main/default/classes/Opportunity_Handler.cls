public with sharing class Opportunity_Handler extends OpportunityTriggerHandler {
    public override virtual void afterInsert() {}
    public override virtual void afterUpdate() {
        Opportunity_Helper.askForProduct(Trigger.new);
    }
    public override virtual void beforeUpdate() {
        Opportunity_Helper.checkReadyToClose(Trigger.new);
    }
    public override virtual void beforeInsert() {}
    public override virtual void beforeDelete() {}
}