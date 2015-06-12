package model.util {
public class PlayerUtil {
	public static const DIMENSION:int = 3;

	public static const WIDTH:int = 500;
	public static const HEIGHT:int = 650;

	public static const PLAYER_A_ID:int = 0;
	public static const PLAYER_B_ID:int = 1;

	private static var playersNames:Array = [];
	playersNames[PLAYER_A_ID] = "A";
	playersNames[PLAYER_B_ID] = "B";

	public static function getDefaultPlayerId():int {
		return Math.random() > 0.5 ? PLAYER_A_ID : PLAYER_B_ID;
	}

	public static function getNextPlayerId(currentPlayerId:int):int {
		return currentPlayerId == PLAYER_A_ID ? PLAYER_B_ID : PLAYER_A_ID;
	}

	public static function getPlayerNameById(id:int):String {
		return playersNames[id];
	}
}
}
