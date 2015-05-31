package context {
import controller.AppController;
import controller.IAppController;

import flash.display.DisplayObjectContainer;

import mediator.AppMediator;
import mediator.MainViewMediator;

import model.AppModel;
import model.IAppModel;

import org.robotlegs.mvcs.Context;

import view.MainView;

public class AppContext extends Context {
	public function AppContext(contextView:DisplayObjectContainer) {
		super(contextView);
	}

	override public function startup():void {
		injector.mapSingleton(AppModel);
		injector.mapValue(IAppModel, injector.getInstance(AppModel));
		injector.mapSingleton(AppController);
		injector.mapValue(IAppController, injector.getInstance(AppController));

		mediatorMap.mapView(MainView, MainViewMediator);
		mediatorMap.mapView(TicTacToe, AppMediator);
	}
}
}
