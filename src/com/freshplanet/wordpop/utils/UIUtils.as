package com.freshplanet.wordpop.utils
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;

	public class UIUtils
	{
		public static var stage:Stage;
		
		public static function centerTo(displayObject:DisplayObject, parent:DisplayObjectContainer):void
		{
			var width:Number = parent is Stage ? stage.stageWidth : parent.width;
			var height:Number = parent is Stage ? stage.stageHeight : parent.height;
			
			displayObject.x = (width - displayObject.width) * 0.5;
			displayObject.y = (height - displayObject.height) * 0.5;
		}
		
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
		
		public static function removeDisplayObject(displayObject:DisplayObject):void
		{
			if(displayObject is Sprite)
				Sprite(displayObject).removeChildren();
			
			if(displayObject.parent)
				displayObject.parent.removeChild(displayObject);
			
			displayObject = null;
		}
	}
}