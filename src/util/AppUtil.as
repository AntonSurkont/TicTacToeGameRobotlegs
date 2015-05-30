package util {
public class AppUtil {
	public static const DIMENSION:int = 3;

	public static const WIDTH:int = 500;
	public static const HEIGHT:int = 650;

	public static function getDefaultPlayerId():int {
		return Math.round(Math.random());
	}
}
}
