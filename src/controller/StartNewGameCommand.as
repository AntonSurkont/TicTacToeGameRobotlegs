package controller {
import component.Pile;

import model.IAppModel;

import org.robotlegs.mvcs.Command;

import util.AppUtil;

public class StartNewGameCommand extends Command {
	[Inject]
	public var appModel:IAppModel;

	override public function execute():void {
		appModel.hasWinner = false;
		appModel.round = 1;
		appModel.playerId = AppUtil.getDefaultPlayerId();

		var pile:Pile;
		for (var i:int = 0; i < AppUtil.DIMENSION; i++) {
			for (var j:int = 0; j < AppUtil.DIMENSION; j++) {
				pile = appModel.piles[i][j];
				pile.reset();
			}
		}
	}
}
}
