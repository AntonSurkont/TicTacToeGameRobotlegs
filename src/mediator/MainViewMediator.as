package mediator {
import event.PileEvent;
import event.RestartEvent;

import flash.events.Event;

import model.IAppModel;

import org.robotlegs.mvcs.Mediator;

import util.AppUtil;

import view.MainView;

public class MainViewMediator extends Mediator {
	[Inject]
	public var mainView:MainView;

	[Inject]
	public var appModel:IAppModel;

	override public function onRegister():void {
		addViewListener(PileEvent.CLICK, onPileClick);
		addViewListener(RestartEvent.CLICK, onRestartClick);

		addContextListener(Event.CHANGE, onModelChanged);

		createPiles();

		mainView.createTitle(appModel.round, AppUtil.getPlayerName(appModel.playerId));
		mainView.createRestart();
	}

	private function createPiles():void {
		for (var i:int = 0; i < AppUtil.DIMENSION; i++) {
			for (var j:int = 0; j < AppUtil.DIMENSION; j++) {
				appModel.piles[i].push( mainView.createPile(i,j) );
			}
		}
	}

	private function onModelChanged(event:Event):void {
		mainView.setTitle(appModel.round, AppUtil.getPlayerName(appModel.playerId), appModel.hasWinner);
	}

	private function onPileClick(e:PileEvent):void {
		dispatch(e.clone());
	}

	private function onRestartClick(e:RestartEvent):void {
		dispatch(e.clone());
	}
}
}
