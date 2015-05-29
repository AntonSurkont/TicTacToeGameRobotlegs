package view {
import component.Pile;
import component.Restart;
import component.Title;

import controller.MainController;

import event.PileEvent;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import model.MainModel;

public class MainView extends Sprite {
	private var _model:MainModel;
	private var _controller:MainController;

	private var titleTextField:Title;

	public function MainView(model:MainModel, controller:MainController) {
		_model = model;
		_controller = controller;

		_model.addEventListener(Event.CHANGE, onModelChanged);
		addEventListener(PileEvent.CLICK, onPileClick);

		createTitle();
		createPiles();
		createRestart();
	}

	private function createTitle():void {
		titleTextField = new Title();
		titleTextField.width = MainModel.WIDTH;
		titleTextField.height = 70;
		titleTextField.y = Math.round((titleTextField.height - titleTextField.textHeight) / 2);
		titleTextField.setText(_model.round, _model.playersArr[_model.playerId]);
		addChild(titleTextField);
	}

	private function createPiles():void {
		var pile:Pile;
		for (var i:int = 0; i < TicTacToeGameRobotlegs.DIMENSION; i++) {
			for (var j:int = 0; j < TicTacToeGameRobotlegs.DIMENSION; j++) {
				pile = new Pile(40 + j * Pile.WIDTH, 105 + i * Pile.HEIGHT);
				_model.piles[i].push(pile);
				addChild(pile);
			}
		}
	}

	private function createRestart():void {
		var restart:Restart = new Restart();
		restart.x = 100;
		restart.y = MainModel.HEIGHT - 84;
		restart.addEventListener(MouseEvent.CLICK, onRestartClick);
		addChild(restart);
	}

	public function onModelChanged(event:Event):void {
		if (!_model.hasWinner) {
			titleTextField.setText(_model.round, _model.playersArr[_model.playerId]);
		}
		else {
			titleTextField.text = "Player " +  _model.playersArr[_model.playerId] + " win the game";
		}
	}

	public function onPileClick(e:PileEvent):void {
		_controller.startNewRound(Pile(e.target));
	}

	public function onRestartClick(e:MouseEvent):void {
		_controller.startNewGame();
	}
}
}