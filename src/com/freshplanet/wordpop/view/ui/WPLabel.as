package com.freshplanet.wordpop.view.ui
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class WPLabel extends Sprite
	{
		private var textField:TextField;
		private var proportionalScale:Boolean;
		
		public function WPLabel(text:String, proportionalScale:Boolean = true)
		{
			this.proportionalScale = proportionalScale;
			
			textField = new TextField();
			textField.height = 18;
			textField.autoSize = TextFieldAutoSize.LEFT;
			textField.selectable = false;
			textField.mouseEnabled = false;
			textField.defaultTextFormat = new TextFormat("_sans", 16, 0x000000);
			textField.text = text;			
			addChild(textField);
		}
		
		override public function set width(value:Number):void
		{
			super.width;
			if(proportionalScale)
				scaleY = scaleX;
		}
		
		override public function set height(value:Number):void
		{
			super.height;
			if(proportionalScale)
				scaleX = scaleY;
		}
	}
}