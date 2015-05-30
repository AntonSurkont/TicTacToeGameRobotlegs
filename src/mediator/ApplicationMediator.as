package mediator {
import controller.MainController;

import model.MainModel;

import org.robotlegs.mvcs.Mediator;

public class ApplicationMediator extends Mediator {
	[Inject]
	public var appView:TicTacToe;

	[Inject]
	public var mainModel:MainModel;

	[Inject]
	public var mainController:MainController;

	override public function onRegister():void {
		appView.model = mainModel;
		appView.controller = mainController;
		appView.createChildren();
	}
}
}
