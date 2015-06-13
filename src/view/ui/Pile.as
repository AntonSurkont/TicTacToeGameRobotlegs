package view.ui {
import flash.display.Sprite;
import flash.events.Event;
import flash.events.TimerEvent;
import flash.utils.Timer;

public class Pile extends Sprite {
	public static const WIDTH:int = 140;
	public static const HEIGHT:int = 140;

	private static const STATE_NONE:int = 0;
	private static const STATE_CIRCLE:int = 1;
	private static const STATE_CROSS:int = 2;

	private static const BORDER_THICKNESS:int = 4;
	private static const SYMBOL_THICKNESS:int = 10;
	private static const BACKGROUND_COLOR:uint = 0x014A7F;
	private static const BORDER_COLOR:uint = 0xFFFFFF;
	private static const SYMBOL_COLOR:uint = 0xF5746F;
	private static const CIRCLE_RADIUS:int = 46;
	private static const MARK_PADDING:int = 30;

	private static const NUMBER_OF_BLINKS:int = 8;

	private var content:Sprite;

	private var blinkTimer:Timer = new Timer(200);
	private var numberOfBlinks:int;

	private var _state:int = STATE_NONE;

	public function get state():int {
		return _state;
	}

	public function Pile() {
		this.buttonMode = true;
		this.useHandCursor = true;
		this.graphics.lineStyle(BORDER_THICKNESS, BORDER_COLOR);
		this.graphics.beginFill(BACKGROUND_COLOR);
		this.graphics.drawRect(0, 0, WIDTH, HEIGHT);
		this.graphics.endFill();

		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		this.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage, false, 0, true);

		content = new Sprite();
		addChild(content);
	}

	public function isEmpty():Boolean {
		return _state == STATE_NONE;
	}

	public function drawCircle():void {
		content.graphics.clear();
		content.graphics.beginFill(SYMBOL_COLOR);
		content.graphics.drawCircle(WIDTH / 2, HEIGHT / 2, CIRCLE_RADIUS);
		content.graphics.endFill();

		content.graphics.beginFill(BACKGROUND_COLOR);
		content.graphics.drawCircle(WIDTH / 2, HEIGHT / 2, CIRCLE_RADIUS - SYMBOL_THICKNESS);
		content.graphics.endFill();
		_state = STATE_CIRCLE;
	}

	public function drawCross():void {
		content.graphics.clear();
		content.graphics.lineStyle(SYMBOL_THICKNESS, SYMBOL_COLOR);
		content.graphics.moveTo(MARK_PADDING, MARK_PADDING);
		content.graphics.lineTo(WIDTH - MARK_PADDING, HEIGHT - MARK_PADDING);
		content.graphics.moveTo(MARK_PADDING, HEIGHT - MARK_PADDING);
		content.graphics.lineTo(WIDTH - MARK_PADDING, MARK_PADDING);
		_state = STATE_CROSS;
	}

	public function reset():void {
		content.graphics.clear();
		_state = STATE_NONE;
	}

	public function blink():void {
		numberOfBlinks = NUMBER_OF_BLINKS;
		blinkTimer.start();
	}

	private function onAddedToStage(event:Event):void {
		blinkTimer.addEventListener(TimerEvent.TIMER, onTimer);
	}

	private function onRemovedFromStage(event:Event):void {
		blinkTimer.removeEventListener(TimerEvent.TIMER, onTimer);
	}

	private function onTimer(event:Event):void {
		blinkTimer.stop();
		numberOfBlinks--;
		if (numberOfBlinks > 0) {
			content.visible = !content.visible;
			blinkTimer.start();
		}
		else {
			content.visible = true;
		}
	}
}
}