package view.ui {
import controller.event.PileEvent;

import flash.events.MouseEvent;

import model.IAppModel;

import org.robotlegs.mvcs.Mediator;

public class PileMediator extends Mediator {
	[Inject]
	public var appModel:IAppModel;

	[Inject]
	public var view:Pile;

	override public function onRegister():void {
		addViewListener(MouseEvent.CLICK, onMouseClick);
	}

	public function onMouseClick(e:MouseEvent):void {
		if (!appModel.hasWinner && view.isEmpty()) {
			appModel.round % 2 == 0 ? view.drawCircle() : view.drawCross();
			dispatch(new PileEvent(PileEvent.CLICK));
		}
	}
}
}
