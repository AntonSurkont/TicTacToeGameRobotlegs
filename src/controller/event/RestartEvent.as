package controller.event {
import flash.events.Event;

public class RestartEvent extends Event {
	public static const CLICK:String = "restartClick";

	public function RestartEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false) {
		super(type, bubbles, cancelable);
	}
}
}
