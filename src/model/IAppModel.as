package model {
public interface IAppModel {
	function get round():int;
	function set round(value:int):void;
	function get hasWinner():Boolean;
	function set hasWinner(value:Boolean):void;
	function isSomePlayerWins():Boolean;
	function nextRound():void;
	function blinkWinPiles():void;
	function resetAllPiles():void;
	function setPiles(piles:Array):void;
}
}
