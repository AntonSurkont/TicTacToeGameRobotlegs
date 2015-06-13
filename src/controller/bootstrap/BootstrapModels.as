package controller.bootstrap {
import model.AppModel;
import model.IAppModel;
import model.IPlayerModel;
import model.PlayerModel;

import org.robotlegs.core.IInjector;

public class BootstrapModels {
	public function BootstrapModels(injector:IInjector) {
		injector.mapSingletonOf(IAppModel, AppModel);
		injector.mapSingletonOf(IPlayerModel, PlayerModel);
	}
}
}
