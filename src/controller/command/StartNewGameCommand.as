package controller.command {
import view.ui.Pile;

import model.IAppModel;

import org.robotlegs.mvcs.Command;

import model.util.PlayerUtil;

public class StartNewGameCommand extends Command {
	[Inject]
	public var appModel:IAppModel;

	override public function execute():void {
		appModel.hasWinner = false;
		appModel.round = 1;
		appModel.playerId = PlayerUtil.getDefaultPlayerId();

		var pile:Pile;
		for (var i:int = 0; i < PlayerUtil.DIMENSION; i++) {
			for (var j:int = 0; j < PlayerUtil.DIMENSION; j++) {
				pile = appModel.piles[i][j];
				pile.reset();
			}
		}
	}
}
}
