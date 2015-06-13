package {
import flash.display.Sprite;

[SWF(width="500", height="650", backgroundColor="#014A7F")]

public class TicTacToe extends Sprite {
	public var context:AppContext;

	public function TicTacToe() {
		context = new AppContext(this);
	}
}
}
