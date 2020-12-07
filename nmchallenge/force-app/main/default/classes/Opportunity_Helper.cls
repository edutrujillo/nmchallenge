public class Opportunity_Helper {
    public static void askForProduct(list<Opportunity> oppL) {
      for (Opportunity opp: oppL) {
          if (Label.Quote_Accepted.equals(opp.StageName)){
           	Asset_Helper.newAsset(opp);   
          }
      }
    }
    public static void checkReadyToClose(list<Opportunity> oppL) {
      for (Opportunity opp: oppL) {
          if (Label.Closed_Won.equals(opp.StageName)){
             Integer nAssets = Opportunity_Selector.getNAssets(opp);
             Integer nAssetsReserved =  Opportunity_Selector.getNReservedAssets(opp);
             if (nAssets != nAssetsReserved){
                opp.addError(Label.Error_ClosedWon);
             }
          }
      }
    }
}