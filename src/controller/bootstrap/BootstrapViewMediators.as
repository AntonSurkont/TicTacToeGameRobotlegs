package controller.bootstrap {
import view.MainViewMediator;

import org.robotlegs.core.IMediatorMap;

import view.MainView;
import view.ui.Pile;
import view.ui.PileMediator;
import view.ui.RestartButton;
import view.ui.RestartButtonMediator;

public class BootstrapViewMediators {
	public function BootstrapViewMediators(mediatorMap:IMediatorMap) {
		mediatorMap.mapView(MainView, MainViewMediator);

		mediatorMap.mapView(RestartButton, RestartButtonMediator);
		mediatorMap.mapView(Pile, PileMediator);
	}
}
}
