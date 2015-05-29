package component {
import event.PileEvent;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;

public class Pile extends Sprite {
	public static const WIDTH:int = 140;
	public static const HEIGHT:int = 140;

	public static const SELECTED_FLAG_NOTHING:int = 0;
	public static const SELECTED_FLAG_CIRCLE:int = 1;
	public static const SELECTED_FLAG_MARK:int = 2;

	private static const BORDER_THICKNESS:int = 4;
	private static const SYMBOL_THICKNESS:int = 10;
	private static const BACKGROUND_COLOR:uint = 0x014A7F;
	private static const BORDER_COLOR:uint = 0xFFFFFF;
	private static const SYMBOL_COLOR:uint = 0xF5746F;
	private static const CIRCLE_RADIUS:int = 46;
	private static const MARK_PADDING:int = 30;

	public var selectedFlag:int = 0;// 1 - circle; 2 - mark; 0 - nothing

	private var content:Sprite;

	private var blinkTimer:Timer = new Timer(200);
	private var timerFlag:int;

	public function Pile(x:int, y:int) {
		this.buttonMode = true;
		this.useHandCursor = true;
		this.graphics.lineStyle(BORDER_THICKNESS, BORDER_COLOR);
		this.x = x;
		this.y = y;
		this.graphics.beginFill(BACKGROUND_COLOR);
		this.graphics.drawRect(0, 0, WIDTH, HEIGHT);
		this.graphics.endFill();

		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		this.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage, false, 0, true);

		content = new Sprite();
		addChild(content);
	}

	public function drawCircle():void {
		content.graphics.clear();
		content.graphics.beginFill(SYMBOL_COLOR);
		content.graphics.drawCircle(WIDTH / 2, HEIGHT / 2, CIRCLE_RADIUS);
		content.graphics.endFill();

		content.graphics.beginFill(BACKGROUND_COLOR);
		content.graphics.drawCircle(WIDTH / 2, HEIGHT / 2, CIRCLE_RADIUS - SYMBOL_THICKNESS);
		content.graphics.endFill();
		selectedFlag = 1;
	}

	public function drawMark():void {
		content.graphics.clear();
		content.graphics.lineStyle(SYMBOL_THICKNESS, SYMBOL_COLOR);
		content.graphics.moveTo(MARK_PADDING, MARK_PADDING);
		content.graphics.lineTo(WIDTH - MARK_PADDING, HEIGHT - MARK_PADDING);
		content.graphics.moveTo(MARK_PADDING, HEIGHT - MARK_PADDING);
		content.graphics.lineTo(WIDTH - MARK_PADDING, MARK_PADDING);
		selectedFlag = 2;
	}

	public function reset():void {
		content.graphics.clear();
		selectedFlag = 0;
	}

	public function blink():void {
		timerFlag = 8;
		blinkTimer.start();
	}

	private function onAddedToStage(event:Event):void {
		this.addEventListener(MouseEvent.CLICK, onClick);
		blinkTimer.addEventListener(TimerEvent.TIMER, onTimer);
	}

	private function onRemovedFromStage(event:Event):void {
		this.removeEventListener(MouseEvent.CLICK, onClick);
		blinkTimer.removeEventListener(TimerEvent.TIMER, onTimer);
	}

	private function onClick(event:Event):void {
		if (selectedFlag == 0)
			dispatchEvent(new PileEvent(PileEvent.CLICK));
	}

	private function onTimer(event:Event):void {
		blinkTimer.stop();
		timerFlag--;
		if (timerFlag > 0) {
			content.visible = !content.visible;
			blinkTimer.start();
		}
		else {
			content.visible = true;
		}
	}
}
}