public class Task_Helper {
    public static void setIdPetcion(list<Task> taskL) {
      List<Id> lidAsset = new List<Id>();
      Map<Id, String> mapAsset = new Map<Id, String>();
      for (Task t: taskL) {
          lidAsset.add(t.WhatId);
      }
      List <Asset> assL = [select id, RequestId__c, Product2.ProductCode from Asset where Id in :lidAsset];
      for (Asset a: assL) {
          mapAsset.put(a.id, a.RequestId__c+','+Product2.ProductCode);
      }
      for (Task t: taskL) {
          if (Label.Asset_Order.equals(t.type)){
              t.Subject = mapAsset.get(t.WhatId);
          }
      }
    }
    public static void avoidDelete(list<Task> taskL) {
      for (Task t: taskL) {
          if (Label.Asset_Order.equals(t.type) && Label.In_Progress.equals(t.status)){
              t.addError(Label.Error_Delete);
          }
      }
    }
}