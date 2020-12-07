trigger Task on Task (before insert, before delete) {
	new Task_Handler().run();
}