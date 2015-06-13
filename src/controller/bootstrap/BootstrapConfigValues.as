package controller.bootstrap {
import model.value.DefaultFieldDimension;

import org.robotlegs.core.IInjector;

public class BootstrapConfigValues {
	public function BootstrapConfigValues(injector:IInjector) {
		injector.mapValue(DefaultFieldDimension, new DefaultFieldDimension(3));
	}
}
}
