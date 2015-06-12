package view.ui {
import controller.event.PileEvent;

import flash.events.MouseEvent;

import org.robotlegs.mvcs.Mediator;

public class PileMediator extends Mediator {
	[Inject]
	public var view:Pile;

	override public function onRegister():void {
		addViewListener(MouseEvent.CLICK, onMouseClick);
	}

	public function onMouseClick(e:MouseEvent):void {
		if (view.selectedFlag == 0)
			dispatch(new PileEvent(PileEvent.CLICK, view));
	}
}
}
