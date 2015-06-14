package controller.command {
import model.IAppModel;
import model.IPlayerModel;
import model.value.DefaultFieldDimension;

import org.robotlegs.mvcs.Command;

import view.ui.Pile;

public class StartNewGameCommand extends Command {
	[Inject]
	public var appModel:IAppModel;

	[Inject]
	public var playerModel:IPlayerModel;

	[Inject]
	public var defaultFieldDimension:DefaultFieldDimension;

	override public function execute():void {
		appModel.hasWinner = false;
		appModel.round = 1;
		resetAllPiles();
		playerModel.resetPlayerId();
	}

	private function resetAllPiles():void {
		var pile:Pile;
		for (var i:int = 0; i < defaultFieldDimension.value; i++) {
			for (var j:int = 0; j < defaultFieldDimension.value; j++) {
				pile = appModel.getPile(i, j);
				pile.reset();
			}
		}
	}
}
}
