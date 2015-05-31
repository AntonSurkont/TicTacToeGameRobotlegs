package model {
public interface IAppModel {
	function get piles():Array;
	function get round():int;
	function set round(value:int):void;
	function get playerId():int;
	function set playerId(value:int):void;
	function get hasWinner():Boolean;
	function set hasWinner(value:Boolean):void;
}
}
