package view {
import component.Pile;
import component.Restart;
import component.Title;

import controller.IAppController;

import event.PileEvent;

import flash.display.Sprite;
import flash.events.MouseEvent;

import model.IAppModel;

import util.AppUtil;

public class MainView extends Sprite {
	private var titleTextField:Title;

	private var _model:IAppModel;

	public function set model(value:IAppModel):void {
		_model = value;
	}

	private var _controller:IAppController;

	public function set controller(value:IAppController):void {
		_controller = value;
	}

	public function MainView() {
		addEventListener(PileEvent.CLICK, onPileClick);
	}

	public function setTitle():void {
		if (!_model.hasWinner) {
			titleTextField.setRoundText(_model.round, AppUtil.getPlayerName(_model.playerId));
		}
		else {
			titleTextField.setWinnerText(AppUtil.getPlayerName(_model.playerId));
		}
	}

	public function createTitle():void {
		titleTextField = new Title();
		titleTextField.width = AppUtil.WIDTH;
		titleTextField.height = 70;
		titleTextField.y = Math.round((titleTextField.height - titleTextField.textHeight) / 2);
		titleTextField.setRoundText(_model.round, AppUtil.getPlayerName(_model.playerId));
		addChild(titleTextField);
	}

	public function createPiles():void {
		var pile:Pile;
		for (var i:int = 0; i < AppUtil.DIMENSION; i++) {
			for (var j:int = 0; j < AppUtil.DIMENSION; j++) {
				pile = new Pile(40 + j * Pile.WIDTH, 105 + i * Pile.HEIGHT);
				_model.piles[i].push(pile);
				addChild(pile);
			}
		}
	}

	public function createRestart():void {
		var restart:Restart = new Restart();
		restart.x = 100;
		restart.y = AppUtil.HEIGHT - 84;
		restart.addEventListener(MouseEvent.CLICK, onRestartClick);
		addChild(restart);
	}

	public function onPileClick(e:PileEvent):void {
		_controller.startNewRound(Pile(e.target));
	}

	public function onRestartClick(e:MouseEvent):void {
		_controller.startNewGame();
	}
}
}