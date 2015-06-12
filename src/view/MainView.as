package view {
import view.ui.Pile;
import view.ui.RestartButton;
import view.ui.Title;

import flash.display.Sprite;

import model.util.PlayerUtil;

public class MainView extends Sprite {
	public static const HORIZONTAL_PILES_GAP:int = 40;
	public static const VERTICAL_PILES_GAP:int = 105;

	private var titleTextField:Title;

	public function MainView() {
	}

	public function setTitle(round:int, player:String, hasWinner:Boolean):void {
		titleTextField.setText(round, player, hasWinner);
	}

	public function createPile(row:int, column:int):Pile {
		var pile:Pile = new Pile();
		pile.x = HORIZONTAL_PILES_GAP + column * Pile.WIDTH;
		pile.y = VERTICAL_PILES_GAP + row * Pile.HEIGHT;
		addChild(pile);
		return pile;
	}

	public function createTitle(round:int, player:String):void {
		titleTextField = new Title();
		titleTextField.width = PlayerUtil.WIDTH;
		titleTextField.height = 70;
		titleTextField.y = Math.round((titleTextField.height - titleTextField.textHeight) / 2);
		titleTextField.setText(round, player);
		addChild(titleTextField);
	}

	public function createRestart():void {
		var restart:RestartButton = new RestartButton();
		restart.x = 100;
		restart.y = PlayerUtil.HEIGHT - 84;
		addChild(restart);
	}
}
}