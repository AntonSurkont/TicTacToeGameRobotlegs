package context {
import controller.StartNewGameCommand;
import controller.StartNewRoundCommand;

import event.PileEvent;
import event.RestartEvent;

import flash.display.DisplayObjectContainer;

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
		commandMap.mapEvent(PileEvent.CLICK, StartNewRoundCommand, PileEvent);
		commandMap.mapEvent(RestartEvent.CLICK, StartNewGameCommand);

		injector.mapSingletonOf(IAppModel, AppModel);

		mediatorMap.mapView(MainView, MainViewMediator);

		contextView.addChild(new MainView());
	}
}
}
