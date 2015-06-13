package controller.command {
import model.IAppModel;
import model.IPlayerModel;

import org.robotlegs.mvcs.Command;

public class StartNewGameCommand extends Command {
	[Inject]
	public var appModel:IAppModel;

	[Inject]
	public var playerModel:IPlayerModel;

	override public function execute():void {
		appModel.hasWinner = false;
		appModel.round = 1;
		appModel.resetAllPiles();
		playerModel.resetPlayerId();
	}
}
}
