package model {
import view.ui.Pile;

import flash.events.Event;

import org.robotlegs.mvcs.Actor;

import model.util.PlayerUtil;

public class AppModel extends Actor implements IAppModel {
	private const ROW:int = 0;
	private const COLUMN:int = 1;
	private const FIRST_DIAGONAL:int = 2;
	private const SECOND_DIAGONAL:int = 3;

	private var winPiles:Array = [];

	private var piles:Array;

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

	public function setPiles(piles:Array):void {
		this.piles = piles;
	}

	public function resetAllPiles():void {
		var pile:Pile;
		for (var i:int = 0; i < PlayerUtil.DIMENSION; i++) {
			for (var j:int = 0; j < PlayerUtil.DIMENSION; j++) {
				pile = piles[i][j];
				pile.reset();
			}
		}
	}

	public function isSomePlayerWins():Boolean {
		for (var i:int = 0; i < PlayerUtil.DIMENSION; i++) {
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

	public function nextRound():void {
		round++;
		playerId = PlayerUtil.getNextPlayerId(playerId);
	}

	public function blinkWinPiles():void {
		for (var i:int = 0; i < PlayerUtil.DIMENSION; i++) {
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
					pile = piles[i][j];
					break;
				case COLUMN:
					pile = piles[j][i];
					break;
				case FIRST_DIAGONAL:
					pile = piles[j][j];
					break;
				case SECOND_DIAGONAL:
					pile = piles[j][PlayerUtil.DIMENSION - 1 - j];
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