package com.freshplanet.wordpop.view.ui
{
	import com.freshplanet.wordpop.api.IButton;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class Button extends Sprite implements IButton
	{
		private var label:Label;
		private var onClickMethod:Function;
		
		public function Button(label:String, color:uint = 0xFFFFFF, numWidth:Number = 100, numHeight:Number = 40, labelWidthRatio:Number = 0.50)
		{
			graphics.clear();
			graphics.beginFill(color);
			graphics.lineStyle(1, 0x000000);
			graphics.drawRect(0, 0, numWidth, numHeight);
			graphics.endFill();
			
			this.label = new Label(label); 
			this.label.width = numWidth * labelWidthRatio;
			this.label.x = (numWidth - this.label.width) * 0.5;
			this.label.y = (numHeight - this.label.height) * 0.5;
			addChild( this.label );
		}
		
		public function get text():String
		{
			return label.text;
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