package com.freshplanet.wordpop.view.ui
{
	import flash.display.Sprite;
	
	public class Letter extends Sprite
	{
		private var label:Label;
		
		public function Letter(value:String)
		{
			var numWidth:int = 60;
			var numHeight:int = numWidth + 20;
			
			graphics.clear();
			graphics.lineStyle(1, 0x000000);
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 0, numWidth, numHeight);
			
			label = new Label(value);
			label.height = numHeight - 10;
			addChild(label);
			
			label.x = (numWidth - label.width) * 0.5;
			label.y = (numHeight - label.height) * 0.5;
			
			label.visible = false;
		}
		
		public function reveal():void
		{
			label.visible = true;
		}
		
		public function get isRevealed():Boolean
		{
			return label.visible;
		}
		
		public function get value():String
		{
			return label.text;
		}
	}
}