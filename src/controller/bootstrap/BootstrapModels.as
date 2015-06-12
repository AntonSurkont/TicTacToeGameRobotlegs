package controller.bootstrap {
import model.AppModel;
import model.IAppModel;

import org.robotlegs.core.IInjector;

public class BootstrapModels {
	public function BootstrapModels(injector:IInjector) {
		injector.mapSingletonOf(IAppModel, AppModel);
	}
}
}
