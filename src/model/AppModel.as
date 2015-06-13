package model {
import model.value.DefaultFieldDimension;

import view.ui.Pile;

import flash.events.Event;

import org.robotlegs.mvcs.Actor;

public class AppModel extends Actor implements IAppModel {
	private const ROW:int = 0;
	private const COLUMN:int = 1;
	private const FIRST_DIAGONAL:int = 2;
	private const SECOND_DIAGONAL:int = 3;

	[Inject]
	public var playerModel:IPlayerModel;

	[Inject]
	public var defaultFieldDimension:DefaultFieldDimension;

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
		for (var i:int = 0; i < defaultFieldDimension.value; i++) {
			for (var j:int = 0; j < defaultFieldDimension.value; j++) {
				pile = piles[i][j];
				pile.reset();
			}
		}
	}

	public function isSomePlayerWins():Boolean {
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

	public function nextRound():void {
		round++;
		playerModel.nextPlayer();
	}

	public function blinkWinPiles():void {
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
					pile = piles[i][j];
					break;
				case COLUMN:
					pile = piles[j][i];
					break;
				case FIRST_DIAGONAL:
					pile = piles[j][j];
					break;
				case SECOND_DIAGONAL:
					pile = piles[j][defaultFieldDimension.value - 1 - j];
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