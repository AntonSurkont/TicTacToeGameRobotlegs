package controller.bootstrap {
import controller.command.StartNewGameCommand;
import controller.command.StartNewRoundCommand;

import controller.event.PileEvent;
import controller.event.RestartEvent;

import org.robotlegs.core.ICommandMap;

public class BootstrapCommands {
	public function BootstrapCommands(commandMap:ICommandMap) {
		commandMap.mapEvent(PileEvent.CLICK, StartNewRoundCommand, PileEvent);
		commandMap.mapEvent(RestartEvent.CLICK, StartNewGameCommand);
	}
}
}
