package model {
import flash.events.Event;

import org.robotlegs.mvcs.Actor;

public class MainModel extends Actor {
	private var _playersArr:Array = ["A", "B"];

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

	public function getPlayerName(playerId:int):String {
		return _playersArr[playerId];
	}
}
}