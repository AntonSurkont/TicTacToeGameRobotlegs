package mediator {
import controller.AppController;

import model.IAppModel;

import org.robotlegs.mvcs.Mediator;

public class AppMediator extends Mediator {
	[Inject]
	public var appView:TicTacToe;

	[Inject]
	public var appModel:IAppModel;

	[Inject]
	public var appController:AppController;

	override public function onRegister():void {
		appView.model = appModel;
		appView.controller = appController;
		appView.createChildren();
	}
}
}
