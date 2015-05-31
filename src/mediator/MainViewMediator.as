package mediator {
import component.Pile;

import controller.IAppController;

import event.PileEvent;
import event.RestartEvent;

import flash.events.Event;

import model.IAppModel;

import org.robotlegs.mvcs.Mediator;

import view.MainView;

public class MainViewMediator extends Mediator {
	[Inject]
	public var mainView:MainView;

	[Inject]
	public var appModel:IAppModel;

	[Inject]
	public var appController:IAppController;

	override public function onRegister():void {
		mainView.model = appModel;

		addViewListener(PileEvent.CLICK, onPileClick);
		addViewListener(RestartEvent.CLICK, onRestartClick);

		addContextListener(Event.CHANGE, onModelChanged);

		mainView.createTitle();
		mainView.createPiles();
		mainView.createRestart();
	}

	private function onModelChanged(event:Event):void {
		mainView.setTitle();
	}

	private function onPileClick(e:PileEvent):void {
		appController.startNewRound(Pile(e.target));
	}

	private function onRestartClick(e:RestartEvent):void {
		appController.startNewGame();
	}
}
}
