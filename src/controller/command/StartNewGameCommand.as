package controller.command {
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
		appModel.resetAllPiles();
	}
}
}
