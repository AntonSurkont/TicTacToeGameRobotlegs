package controller.event {
import flash.events.Event;

public class PileEvent extends Event {
	public static const CLICK:String = "pileClick";

	public function PileEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false) {
		super(type, bubbles, cancelable);
	}
}
}