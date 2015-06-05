package controller {
import component.Pile;

import event.PileEvent;

import model.IAppModel;

import org.robotlegs.mvcs.Command;

public class StartNewRoundCommand extends Command {
	[Inject]
	public var appModel:IAppModel;

	[Inject]
	public var pileEvent:PileEvent;

	override public function execute():void {
		if (appModel.hasWinner)
			return;

		var pile:Pile = pileEvent.pile;
		appModel.round % 2 == 0 ? pile.drawCircle() : pile.drawMark();

		if (appModel.isSomePlayerWins()) {
			appModel.hasWinner = true;
		}
		else {
			appModel.nextRound();
		}
	}
}
}
