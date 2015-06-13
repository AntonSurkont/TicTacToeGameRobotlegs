package model {
import flash.events.Event;

import org.robotlegs.mvcs.Actor;

public class PlayerModel extends Actor implements IPlayerModel {
	private static const PLAYER_A_ID:int = 0;
	private static const PLAYER_B_ID:int = 1;

	private static var playersNames:Array = [];
	playersNames[PLAYER_A_ID] = "A";
	playersNames[PLAYER_B_ID] = "B";

	private var _playerId:int = getDefaultPlayerId();

	private function get playerId():int {
		return _playerId;
	}

	private function set playerId(value:int):void {
		if (_playerId != value) {
			_playerId = value;
			dispatch(new Event(Event.CHANGE));
		}
	}

	public function getPlayerName():String {
		return playersNames[playerId];
	}

	public function nextPlayer():void {
		playerId = playerId == PLAYER_A_ID ? PLAYER_B_ID : PLAYER_A_ID;
	}

	public function resetPlayerId():void {
		playerId = getDefaultPlayerId();
	}

	private static function getDefaultPlayerId():int {
		return Math.random() > 0.5 ? PLAYER_A_ID : PLAYER_B_ID;
	}
}
}
