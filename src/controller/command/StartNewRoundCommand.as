package controller.command {
import model.IAppModel;
import model.IPlayerModel;
import model.value.DefaultFieldDimension;

import org.robotlegs.mvcs.Command;

import view.ui.Pile;

public class StartNewRoundCommand extends Command {
	private const ROW:int = 0;
	private const COLUMN:int = 1;
	private const FIRST_DIAGONAL:int = 2;
	private const SECOND_DIAGONAL:int = 3;

	[Inject]
	public var appModel:IAppModel;

	[Inject]
	public var playerModel:IPlayerModel;

	[Inject]
	public var defaultFieldDimension:DefaultFieldDimension;

	private var winPiles:Array = [];

	override public function execute():void {
		if (isSomePlayerWins()) {
			appModel.hasWinner = true;
			blinkWinPiles();
		}
		else {
			appModel.nextRound();
			playerModel.nextPlayer();
		}
	}

	private function isSomePlayerWins():Boolean {
		for (var i:int = 0; i < defaultFieldDimension.value; i++) {
			if (haveWinningSet(ROW, i))
				return true;
			if (haveWinningSet(COLUMN, i))
				return true;
		}

		if (haveWinningSet(FIRST_DIAGONAL))
			return true;
		if (haveWinningSet(SECOND_DIAGONAL))
			return true;

		return false;
	}

	private function blinkWinPiles():void {
		for (var i:int = 0; i < defaultFieldDimension.value; i++) {
			Pile(winPiles[i]).blink();
		}
	}

	private function haveWinningSet(flag:int, i:int = 0):Boolean {
		var pile:Pile;
		var firstPileState:int;
		winPiles = [];
		for (var j:int = 0; j < 3; j++) {
			switch (flag) {
				case ROW:
					pile = appModel.getPile(i, j);
					break;
				case COLUMN:
					pile = appModel.getPile(j, i);
					break;
				case FIRST_DIAGONAL:
					pile = appModel.getPile(j, j);
					break;
				case SECOND_DIAGONAL:
					pile = appModel.getPile(j, defaultFieldDimension.value - 1 - j);
					break;
			}
			if (pile.isEmpty())
				return false;
			if (j == 0) {
				firstPileState = pile.state;
			}
			else {
				if (firstPileState != pile.state)
					return false;
			}
			winPiles.push(pile);
		}
		return true;
	}
}
}
