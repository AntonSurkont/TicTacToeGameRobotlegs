package model {
import view.ui.Pile;

public interface IAppModel {
	function get round():int;
	function set round(value:int):void;
	function get hasWinner():Boolean;
	function set hasWinner(value:Boolean):void;
	function set piles(piles:Vector.<Vector.<Pile>>):void;
	function nextRound():void;
	function getPile(row:int, column:int):Pile;
}
}
