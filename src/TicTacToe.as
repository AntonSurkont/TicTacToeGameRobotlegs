package {
import context.AppContext;

import controller.IAppController;

import flash.display.Sprite;

import model.IAppModel;

import view.MainView;

[SWF(width="500", height="650", backgroundColor="#014A7F")]

public class TicTacToe extends Sprite {
	public var context:AppContext;

	private var _view:MainView;

	private var _model:IAppModel;

	public function set model(value:IAppModel):void {
		_model = value;
	}

	private var _controller:IAppController;

	public function set controller(value:IAppController):void {
		_controller = value;
	}

	public function TicTacToe() {
		context = new AppContext(this);
	}

	public function createChildren():void {
		_controller.model = _model;
		_view = new MainView();
		_view.controller = _controller;
		addChild(_view);
	}
}
}
