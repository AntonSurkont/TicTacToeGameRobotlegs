package mediator {
import controller.IAppController;

import model.IAppModel;

import org.robotlegs.mvcs.Mediator;

public class AppMediator extends Mediator {
	[Inject]
	public var appView:TicTacToe;

	[Inject]
	public var appModel:IAppModel;

	[Inject]
	public var appController:IAppController;

	override public function onRegister():void {
		appController.model = appModel;
	}
}
}
