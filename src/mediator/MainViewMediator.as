package mediator {
import component.Pile;

import controller.IAppController;

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

	[Inject]
	public var appController:IAppController;

	override public function onRegister():void {
		addViewListener(PileEvent.CLICK, onPileClick);
		addViewListener(RestartEvent.CLICK, onRestartClick);

		addContextListener(Event.CHANGE, onModelChanged);

		createPiles();

		mainView.createTitle(appModel.round, AppUtil.getPlayerName(appModel.playerId));
		mainView.createRestart();
	}

	private function createPiles():void {
		var pile:Pile;
		for (var i:int = 0; i < AppUtil.DIMENSION; i++) {
			for (var j:int = 0; j < AppUtil.DIMENSION; j++) {
				pile = new Pile(MainView.HORIZONTAL_PILES_GAP + j * Pile.WIDTH, MainView.VERTICAL_PILES_GAP + i * Pile.HEIGHT);
				appModel.piles[i].push(pile);
				mainView.addChild(pile);
			}
		}
	}

	private function onModelChanged(event:Event):void {
		mainView.setTitle(appModel.round, AppUtil.getPlayerName(appModel.playerId), appModel.hasWinner);
	}

	private function onPileClick(e:PileEvent):void {
		appController.startNewRound(Pile(e.target));
	}

	private function onRestartClick(e:RestartEvent):void {
		appController.startNewGame();
	}
}
}
