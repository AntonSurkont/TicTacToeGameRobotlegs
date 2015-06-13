package view {
import flash.events.Event;

import model.IAppModel;
import model.IPlayerModel;
import model.value.DefaultFieldDimension;

import org.robotlegs.mvcs.Mediator;

public class MainViewMediator extends Mediator {
	[Inject]
	public var appModel:IAppModel;

	[Inject]
	public var playerModel:IPlayerModel;

	[Inject]
	public var mainView:MainView;

	[Inject]
	public var defaultFieldDimension:DefaultFieldDimension;

	override public function onRegister():void {
		addContextListener(Event.CHANGE, onModelChanged);

		createPiles();

		mainView.createTitle(appModel.round, playerModel.getPlayerName());
		mainView.createRestart();
	}

	private function createPiles():void {
		var piles:Array = [[], [], []];
		for (var i:int = 0; i < defaultFieldDimension.value; i++) {
			for (var j:int = 0; j < defaultFieldDimension.value; j++) {
				piles[i].push( mainView.createPile(i,j) );
			}
		}
		appModel.setPiles(piles);
	}

	private function onModelChanged(event:Event):void {
		mainView.setTitle(appModel.round, playerModel.getPlayerName(), appModel.hasWinner);
	}
}
}
