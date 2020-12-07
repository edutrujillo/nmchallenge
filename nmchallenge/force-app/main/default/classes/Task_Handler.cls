public class Task_Handler extends TaskTriggerHandler{
	public override virtual void afterInsert() {}
    public override virtual void afterUpdate() {}
    public override virtual void beforeInsert() {
        Task_Helper.setIdPetcion(Trigger.new);
    }
    public override virtual void beforeDelete() {
        Task_Helper.avoidDelete(Trigger.old);
    }
}