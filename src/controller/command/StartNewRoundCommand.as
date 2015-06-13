package controller.command {
import model.IAppModel;

import org.robotlegs.mvcs.Command;

public class StartNewRoundCommand extends Command {
	[Inject]
	public var appModel:IAppModel;

	override public function execute():void {
		if (appModel.isSomePlayerWins()) {
			appModel.hasWinner = true;
			appModel.blinkWinPiles();
		}
		else {
			appModel.nextRound();
		}
	}
}
}
