package com.freshplanet.wordpop.view.ui
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class Label extends Sprite
	{
		private var textField:TextField;
		private var proportionalScale:Boolean;
		
		public function Label(text:String, proportionalScale:Boolean = true)
		{
			this.proportionalScale = proportionalScale;
			
			var format:TextFormat = new TextFormat("_sans", 60, 0x000000);
			format.align = TextFormatAlign.CENTER;
			
			textField = new TextField();
			textField.autoSize = TextFieldAutoSize.LEFT;
			textField.selectable = false;
			textField.mouseEnabled = false;
			textField.defaultTextFormat = format
			textField.text = text;			
			addChild(textField);
		}
		
		public function set text(value:String):void
		{
			textField.text = value;
		}
		
		public function get text():String
		{
			return textField.text;
		}
		
		override public function set width(value:Number):void
		{
			super.width = value;
			
			if(proportionalScale)
				super.height *= scaleX;
		}
		
		override public function set height(value:Number):void
		{
			super.height = value;
			
			if(proportionalScale)
				super.width *= scaleY;
		}
	}
}