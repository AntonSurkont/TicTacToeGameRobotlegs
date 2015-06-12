package view.ui {
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

public class Title extends TextField {
	public function Title() {
		var newFormat:TextFormat = new TextFormat();
		newFormat.color = 0xFFFFFF;
		newFormat.size = 26;
		newFormat.bold = true;
		newFormat.align = TextFormatAlign.CENTER;
		newFormat.font = "Arial";
		this.defaultTextFormat = newFormat;
	}

	public function setText(round:int, player:String, hasWinner:Boolean = false):void {
		if (!hasWinner) {
			this.text = "ROUND " + round + ": PLAYER " + player;
		}
		else {
			this.text = "Player " +  player + " win the game";
		}
	}
}
}