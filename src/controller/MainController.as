package controller {
import component.Pile;

import model.MainModel;

public class MainController {
	private const ROW:int = 0;
	private const COLUMN:int = 1;
	private const FIRST_DIAGONAL:int = 2;
	private const SECOND_DIAGONAL:int = 3;

	private var _model:MainModel;

	public function MainController(model:MainModel) {
		this._model = model;
	}

	public function startNewRound(pile:Pile):void {
		if (_model.hasWinner)
			return;

		_model.round % 2 == 0 ? pile.drawCircle() : pile.drawMark();

		if (somePlayerWins()) {
			_model.hasWinner = true;
		}
		else {
			_model.round++;
			_model.playerId = _model.playerId == 0 ? 1 : 0;
		}
	}

	public function startNewGame():void {
		_model.hasWinner = false;
		_model.round = 1;
		_model.playerId = MainModel.getPlayerId();

		var pile:Pile;
		for (var i:int = 0; i < TicTacToeGameRobotlegs.DIMENSION; i++) {
			for (var j:int = 0; j < TicTacToeGameRobotlegs.DIMENSION; j++) {
				pile = _model.piles[i][j];
				pile.reset();
			}
		}
	}

	private function somePlayerWins():Boolean {
		var result:Boolean = false;

		for (var i:int = 0; i < TicTacToeGameRobotlegs.DIMENSION; i++) {
			if (checkWinSet(ROW, i))
				return true;
			if (checkWinSet(COLUMN, i))
				return true;
		}

		if (checkWinSet(FIRST_DIAGONAL))
			return true;
		if (checkWinSet(SECOND_DIAGONAL))
			return true;

		return result;
	}

	private function checkWinSet(flag:int, i:int = 0):Boolean {
		var result:Boolean = true;
		var pile:Pile;
		var piles:Array = [];
		var selectedFlag:int;
		for (var j:int = 0; j < 3; j++) {
			switch (flag) {
				case ROW:
					pile = _model.piles[i][j];
					break;
				case COLUMN:
					pile = _model.piles[j][i];
					break;
				case FIRST_DIAGONAL:
					pile = _model.piles[j][j];
					break;
				case SECOND_DIAGONAL:
					pile = _model.piles[j][TicTacToeGameRobotlegs.DIMENSION - 1 - j];
					break;
			}
			if (pile.selectedFlag == Pile.SELECTED_FLAG_NOTHING)
				return false;
			piles.push(pile);
			if (j == 0) {
				selectedFlag = pile.selectedFlag;
			}
			else {
				if (selectedFlag != pile.selectedFlag)
					return false;
			}
		}
		blinkWinPiles(piles);
		return result;
	}

	private function blinkWinPiles(piles:Array):void {
		for (var j:int = 0; j < TicTacToeGameRobotlegs.DIMENSION; j++) {
			Pile(piles[j]).blink();
		}
	}
}
}