package view {
import flash.events.Event;

import model.IAppModel;
import model.IPlayerModel;
import model.value.DefaultFieldDimension;

import org.robotlegs.mvcs.Mediator;

import view.ui.Pile;

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

		appModel.piles = createPiles();

		mainView.createTitle(appModel.round, playerModel.getPlayerName());
		mainView.createRestart();
	}

	private function onModelChanged(event:Event):void {
		mainView.setTitle(appModel.round, playerModel.getPlayerName(), appModel.hasWinner);
	}

	private function createPiles():Vector.<Vector.<Pile>> {
		var result:Vector.<Vector.<Pile>> = new Vector.<Vector.<Pile>>();
		for (var i:int = 0; i < defaultFieldDimension.value; i++) {
			result[i] = new Vector.<Pile>();
			for (var j:int = 0; j < defaultFieldDimension.value; j++) {
				result[i].push( mainView.createPile(i,j) );
			}
		}
		return result;
	}
}
}
