package com.freshplanet.wordpop.utils
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;

	public class UIUtils
	{
		public static var stage:Stage;
		
		public static function setWidthProportional(displayObject:DisplayObject, width:Number):void
		{
			displayObject.width = width;
			displayObject.height *= displayObject.scaleX;
		}
		
		public static function setHeightProportional(displayObject:DisplayObject, height:Number):void
		{
			displayObject.height = height;
			displayObject.width *= displayObject.scaleY;
		}
		
		public static function clearDisplayObject(displayObject:DisplayObject):void
		{
			if(displayObject is Sprite)
				Sprite(displayObject).removeChildren();
			
			if(displayObject.parent)
				displayObject.parent.removeChild(displayObject);
			
			displayObject = null;
		}
	}
}