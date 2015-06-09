package model {
import component.Pile;

import flash.events.Event;

import org.robotlegs.mvcs.Actor;

import util.AppUtil;

public class AppModel extends Actor implements IAppModel {
	private const ROW:int = 0;
	private const COLUMN:int = 1;
	private const FIRST_DIAGONAL:int = 2;
	private const SECOND_DIAGONAL:int = 3;

	private var _piles:Array = [[], [], []];

	public function get piles():Array {
		return _piles;
	}

	private var _round:int = 1;

	public function get round():int {
		return _round;
	}

	public function set round(value:int):void {
		if (_round != value) {
			_round = value;
			dispatch(new Event(Event.CHANGE));
		}
	}

	private var _playerId:int = 0;

	public function get playerId():int {
		return _playerId;
	}

	public function set playerId(value:int):void {
		if (_playerId != value) {
			_playerId = value;
			dispatch(new Event(Event.CHANGE));
		}
	}

	private var _hasWinner:Boolean = false;

	public function get hasWinner():Boolean {
		return _hasWinner;
	}

	public function set hasWinner(value:Boolean):void {
		if (_hasWinner != value) {
			_hasWinner = value;
			dispatch(new Event(Event.CHANGE));
		}
	}

	public function isSomePlayerWins():Boolean {
		var result:Boolean = false;

		for (var i:int = 0; i < AppUtil.DIMENSION; i++) {
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

	public function nextRound():void {
		round++;
		playerId = AppUtil.getNextPlayerId(playerId);
	}

	private function checkWinSet(flag:int, i:int = 0):Boolean {
		var result:Boolean = true;
		var pile:Pile;
		var winPiles:Array = [];
		var selectedFlag:int;
		for (var j:int = 0; j < 3; j++) {
			switch (flag) {
				case ROW:
					pile = _piles[i][j];
					break;
				case COLUMN:
					pile = _piles[j][i];
					break;
				case FIRST_DIAGONAL:
					pile = _piles[j][j];
					break;
				case SECOND_DIAGONAL:
					pile = _piles[j][AppUtil.DIMENSION - 1 - j];
					break;
			}
			if (pile.selectedFlag == Pile.SELECTED_FLAG_NOTHING)
				return false;
			winPiles.push(pile);
			if (j == 0) {
				selectedFlag = pile.selectedFlag;
			}
			else {
				if (selectedFlag != pile.selectedFlag)
					return false;
			}
		}
		blinkWinPiles(winPiles);
		return result;
	}

	private function blinkWinPiles(piles:Array):void {
		for (var j:int = 0; j < AppUtil.DIMENSION; j++) {
			Pile(piles[j]).blink();
		}
	}
}
}