/**
 * @Author: Eduardo Trujillo
 * 
 */ 
public class Asset_Helper {
	public static void newAsset(Opportunity opp) {
        List<OpportunityLineItem> oliL = [select id, Product2.Name from OpportunityLineItem where OpportunityId = :opp.Id];
        Id c = [select Account.PersonContactId from Opportunity where id = :opp.Id][0].Account.PersonContactId;
        for (OpportunityLineItem oli: oliL) {
            Asset ass = new Asset();
            ass.Name = 'Request: '+oli.Product2.Name +' for: ' +opp.Name;
            ass.Opportunity__c = opp.Id;
            ass.AccountId = opp.AccountId;
            ass.Product2Id = oli.Product2Id;
            insert ass;
            Task t = new Task();
            t.Subject = ass.RequestId__c;
            t.OwnerId = opp.OwnerId;
            t.Status = 'In Progress';
            t.WhatId = ass.Id;
            t.WhoId = c;
            t.Type = 'Asset Order';
            insert t;
            oli.Asset__c = ass.Id;
            update oli;
        }
    }
}