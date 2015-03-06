package com.freshplanet.wordpop.view.ui
{
	import com.freshplanet.wordpop.api.IButton;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class ColorButton extends Sprite implements IButton
	{
		protected var onClickMethod:Function;
		protected var numWidth:Number;
		protected var numHeight:Number;
		protected var bgColor:uint;
		
		public function ColorButton(color:uint = 0xFFFFFF, numWidth:Number = 100, numHeight:Number = 40)
		{
			this.numWidth = numWidth;
			this.numHeight= numHeight;
			this.bgColor = color;
			
			buttonMode = useHandCursor = false;
			mouseChildren = false;
			
			buildBackground();
			
			addEventListener(Event.REMOVED_FROM_STAGE, handleRemovedFromStage);
		}
		
		protected function handleRemovedFromStage(event:Event):void
		{
			removeEventListener(MouseEvent.CLICK, handleClick);
			removeChildren();
		}
		
		private function buildBackground():void
		{
			graphics.clear();
			graphics.beginFill(bgColor);
			graphics.lineStyle(1, 0x000000);
			graphics.drawRect(0, 0, numWidth, numHeight);
			graphics.endFill();
		}
		
		public function set color(value:uint):void
		{
			this.bgColor = color;
			buildBackground();
		}
		
		public function set onClick(value:Function):void
		{
			mouseChildren = false;
			buttonMode = true;
			useHandCursor = true;
			onClickMethod = value;
			
			addEventListener(MouseEvent.CLICK, handleClick);
		}
		
		protected function handleClick(event:MouseEvent):void
		{
			onClickMethod.call(null, this);
		}
	}
}