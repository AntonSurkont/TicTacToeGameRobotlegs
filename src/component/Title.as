package component {
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

	public function setRoundText(round:int, player:String):void {
		this.text = "ROUND " + round + ": PLAYER " + player;
	}

	public function setWinnerText(player:String):void {
		this.text = "Player " +  player + " win the game";
	}
}
}