package view {
import flash.events.Event;

import model.IAppModel;

import org.robotlegs.mvcs.Mediator;

import model.util.PlayerUtil;

public class MainViewMediator extends Mediator {
	[Inject]
	public var appModel:IAppModel;

	[Inject]
	public var mainView:MainView;

	override public function onRegister():void {
		addContextListener(Event.CHANGE, onModelChanged);

		createPiles();

		mainView.createTitle(appModel.round, PlayerUtil.getPlayerNameById(appModel.playerId));
		mainView.createRestart();
	}

	private function createPiles():void {
		var piles:Array = [[], [], []];
		for (var i:int = 0; i < PlayerUtil.DIMENSION; i++) {
			for (var j:int = 0; j < PlayerUtil.DIMENSION; j++) {
				piles[i].push( mainView.createPile(i,j) );
			}
		}
		appModel.setPiles(piles);
	}

	private function onModelChanged(event:Event):void {
		mainView.setTitle(appModel.round, PlayerUtil.getPlayerNameById(appModel.playerId), appModel.hasWinner);
	}
}
}
