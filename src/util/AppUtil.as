package util {
public class AppUtil {
	public static const DIMENSION:int = 3;

	public static const WIDTH:int = 500;
	public static const HEIGHT:int = 650;

	private static var playersArr:Array = ["A", "B"];

	public static function getDefaultPlayerId():int {
		return Math.round(Math.random());
	}

	public static function getPlayerName(playerId:int):String {
		return playersArr[playerId];
	}
}
}
