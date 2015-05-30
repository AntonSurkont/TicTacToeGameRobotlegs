package context {
import controller.MainController;

import flash.display.DisplayObjectContainer;

import mediator.ApplicationMediator;
import mediator.MainViewMediator;

import model.MainModel;

import org.robotlegs.mvcs.Context;

import view.MainView;

public class TicTacToeContext extends Context {
	public function TicTacToeContext(contextView:DisplayObjectContainer) {
		super(contextView);
	}

	override public function startup():void {
		injector.mapSingleton(MainModel);
		injector.mapSingleton(MainController);

		mediatorMap.mapView(MainView, MainViewMediator);
		mediatorMap.mapView(TicTacToe, ApplicationMediator);
	}
}
}
