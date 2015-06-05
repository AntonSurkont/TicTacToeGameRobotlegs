package view {
import component.Pile;
import component.Restart;
import component.Title;

import flash.display.Sprite;

import util.AppUtil;

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
		titleTextField.width = AppUtil.WIDTH;
		titleTextField.height = 70;
		titleTextField.y = Math.round((titleTextField.height - titleTextField.textHeight) / 2);
		titleTextField.setText(round, player);
		addChild(titleTextField);
	}

	public function createRestart():void {
		var restart:Restart = new Restart();
		restart.x = 100;
		restart.y = AppUtil.HEIGHT - 84;
		addChild(restart);
	}
}
}