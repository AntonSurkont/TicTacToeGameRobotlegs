package controller {
import component.Pile;

import model.IAppModel;

public interface IAppController {
	function set model(value:IAppModel):void;
	function startNewRound(pile:Pile):void;
	function startNewGame():void;
}
}
