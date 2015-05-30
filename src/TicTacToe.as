package {
import context.TicTacToeContext;

import controller.MainController;

import flash.display.Sprite;

import model.MainModel;

import view.MainView;

[SWF(width="500", height="650", backgroundColor="#014A7F")]

public class TicTacToe extends Sprite {
	public var context:TicTacToeContext;

	private var _view:MainView;

	private var _model:MainModel;
	private var _controller:MainController;

	public function set model(value:MainModel):void {
		_model = value;
	}

	public function set controller(value:MainController):void {
		_controller = value;
	}

	public function TicTacToe() {
		context = new TicTacToeContext(this);
	}

	public function createChildren():void {
		//_model = new MainModel();
		_controller = new MainController(_model);
		_view = new MainView(_controller);
		addChild(_view);
	}
}
}
