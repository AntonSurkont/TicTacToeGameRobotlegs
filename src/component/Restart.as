package component {
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

public class Restart extends Sprite {
	private static const BACKGROUND_COLOR:uint = 0x014A7F;
	private static const BORDER_COLOR:uint = 0xFFFFFF;

	public function Restart() {
		var newFormat:TextFormat = new TextFormat();
		newFormat.color = 0xFFFFFF;
		newFormat.size = 26;
		newFormat.bold = true;
		newFormat.align = TextFormatAlign.CENTER;
		newFormat.font = "Arial";

		var sprite:Sprite = new Sprite();
		sprite.buttonMode = true;
		sprite.useHandCursor = true;
		sprite.graphics.beginFill(BORDER_COLOR);
		sprite.graphics.drawRect(0, 0, 294, 47);
		sprite.graphics.endFill();
		sprite.graphics.beginFill(BACKGROUND_COLOR);
		sprite.graphics.drawRect(2, 2, 290, 43);
		sprite.graphics.endFill();
		addChild(sprite);

		var restartTextField:TextField = new TextField();
		restartTextField.defaultTextFormat = newFormat;
		restartTextField.mouseEnabled = false;
		restartTextField.selectable = false;
		restartTextField.width = 294;
		restartTextField.height = 35;
		restartTextField.y = 7;
		restartTextField.text = "START A NEW GAME";
		addChild(restartTextField);
	}
}
}