package controller.event {
import view.ui.Pile;

import flash.events.Event;

public class PileEvent extends Event {
	public static const CLICK:String = "pileClick";

	private var _pile:Pile;

	public function get pile():Pile {
		return _pile;
	}

	public function PileEvent(type:String, pile:Pile = null, bubbles:Boolean = true, cancelable:Boolean = false) {
		super(type, bubbles, cancelable);
		this._pile = pile;
	}

	override public function clone():Event {
		return new PileEvent(type, _pile, bubbles, cancelable);
	}
}
}