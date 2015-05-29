package model {
import flash.events.Event;
import flash.events.EventDispatcher;

public class MainModel extends EventDispatcher {
	public static const WIDTH:int = 500;
	public static const HEIGHT:int = 650;

	public var playersArr:Array = ["A", "B"];
	public var piles:Array= [[], [], []];

	public function MainModel() {
		_playerId = getPlayerId();
	}

	private var _round:int = 1;

	public function get round():int {
		return _round;
	}

	public function set round(value:int):void {
		if (_round != value) {
			_round = value;
			dispatchEvent(new Event(Event.CHANGE));
		}
	}

	private var _playerId:int = 0;

	public function get playerId():int {
		return _playerId;
	}

	public function set playerId(value:int):void {
		if (_playerId != value) {
			_playerId = value;
			dispatchEvent(new Event(Event.CHANGE));
		}
	}

	private var _hasWinner:Boolean = false;

	public function get hasWinner():Boolean {
		return _hasWinner;
	}

	public function set hasWinner(value:Boolean):void {
		if (_hasWinner != value) {
			_hasWinner = value;
			dispatchEvent(new Event(Event.CHANGE));
		}
	}

	public static function getPlayerId():int {
		return Math.round(Math.random());
	}
}
}