package view.ui {
import controller.event.RestartEvent;

import flash.events.MouseEvent;

import org.robotlegs.mvcs.Mediator;

public class RestartButtonMediator extends Mediator {
	[Inject]
	public var view:RestartButton;

	override public function onRegister():void {
		addViewListener(MouseEvent.CLICK, onMouseClick);
	}

	public function onMouseClick(e:MouseEvent):void {
		dispatch(new RestartEvent(RestartEvent.CLICK));
	}
}
}
