package model {
import view.ui.Pile;

import flash.events.Event;

import org.robotlegs.mvcs.Actor;

public class AppModel extends Actor implements IAppModel {
	private var _piles:Vector.<Vector.<Pile>>;

	public function set piles(piles:Vector.<Vector.<Pile>>):void {
		_piles = piles;
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

	public function nextRound():void {
		round++;
	}

	public function getPile(row:int, column:int):Pile {
		return _piles[row][column];
	}
}
}