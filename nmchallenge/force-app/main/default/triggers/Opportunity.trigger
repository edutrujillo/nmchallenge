trigger Opportunity on Opportunity (before insert, before update, before delete, after insert, after update, after delete) {
    new Opportunity_Handler().run();
}