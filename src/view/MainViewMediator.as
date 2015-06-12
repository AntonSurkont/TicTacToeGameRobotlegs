package view {
import flash.events.Event;

import model.IAppModel;

import org.robotlegs.mvcs.Mediator;

import model.util.PlayerUtil;

public class MainViewMediator extends Mediator {
	[Inject]
	public var mainView:MainView;

	[Inject]
	public var appModel:IAppModel;

	override public function onRegister():void {
		addContextListener(Event.CHANGE, onModelChanged);

		createPiles();

		mainView.createTitle(appModel.round, PlayerUtil.getPlayerNameById(appModel.playerId));
		mainView.createRestart();
	}

	private function createPiles():void {
		for (var i:int = 0; i < PlayerUtil.DIMENSION; i++) {
			for (var j:int = 0; j < PlayerUtil.DIMENSION; j++) {
				appModel.piles[i].push( mainView.createPile(i,j) );
			}
		}
	}

	private function onModelChanged(event:Event):void {
		mainView.setTitle(appModel.round, PlayerUtil.getPlayerNameById(appModel.playerId), appModel.hasWinner);
	}
}
}
