public with sharing class Opportunity_Selector {
    public static Integer getNAssets(Opportunity opp) {
        Integer count = [SELECT Count() FROM Asset where Opportunity__c = :opp.Id];
        return count;
    }
    public static Integer getNReservedAssets(Opportunity opp) {
        Integer count = [SELECT Count() FROM Asset where Opportunity__c = :opp.Id AND Status = 'Reserved'];
        return count;
    }
}
