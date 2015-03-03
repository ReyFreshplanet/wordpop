package com.freshplanet.wordpop.view.ui
{
	import com.freshplanet.wordpop.api.IButton;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class WPSimpleButton extends Sprite implements IButton
	{
		private var label:WPLabel;
		
		public function WPSimpleButton(label:String, color:uint = 0xFFFFFF, numWidth:Number = 100, numHeight:Number = 40)
		{
			graphics.clear();
			graphics.beginFill(color);
			graphics.lineStyle(1, 0x000000);
			graphics.drawRect(0, 0, numWidth, numHeight);
			graphics.endFill();
			
			this.label = new WPLabel(label); 
			this.label.width = numWidth - 10;
			this.label.x = (numWidth - this.label.width) * 0.5;
			this.label.y = (numHeight - this.label.height) * 0.5;
			addChild( this.label );
		}
		
		public function set onClick(value:Function):void
		{
			mouseChildren = false;
			buttonMode = true;
			useHandCursor = true;
			
			addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void
			{
				value.call();
			});
		}
	}
}