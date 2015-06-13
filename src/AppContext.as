package {
import controller.bootstrap.BootstrapCommands;
import controller.bootstrap.BootstrapConfigValues;
import controller.bootstrap.BootstrapModels;
import controller.bootstrap.BootstrapViewMediators;

import flash.display.DisplayObjectContainer;

import org.robotlegs.mvcs.Context;

import view.MainView;

public class AppContext extends Context {
	public function AppContext(contextView:DisplayObjectContainer) {
		super(contextView);
	}

	override public function startup():void {
		new BootstrapCommands(commandMap);
		new BootstrapModels(injector);
		new BootstrapViewMediators(mediatorMap);
		new BootstrapConfigValues(injector);

		addRootView();

		super.startup();
	}

	protected function addRootView():void {
		contextView.addChild(new MainView());
	}
}
}
