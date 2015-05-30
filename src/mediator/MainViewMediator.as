package mediator {

import flash.events.Event;

import model.MainModel;

import org.robotlegs.mvcs.Mediator;

import view.MainView;

public class MainViewMediator extends Mediator {
	[Inject]
	public var mainView:MainView;

	[Inject]
	public var mainModel:MainModel;

	override public function onRegister():void {
		mainView.model = mainModel;

		addContextListener(Event.CHANGE, onModelChanged);

		mainView.createTitle();
		mainView.createPiles();
		mainView.createRestart();
	}

	public function onModelChanged(event:Event):void {
		mainView.setTitle();
	}
}
}
