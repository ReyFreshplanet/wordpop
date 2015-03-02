package com.freshplanet.wordpop.view
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FullScreenEvent;
	
	public class AbstractView extends Sprite
	{
		protected var isFullscreen:Boolean;
		private var _id:String;
		
		public function AbstractView(viewId:String = null)
		{
			id = viewId;
			addEventListener( Event.ADDED_TO_STAGE, handleAdded );
			isFullscreen = false;
		}
		
		public function initialize():void
		{
		}
		
		public function build():void
		{
		}
		
		public function clear():void
		{
		}
		
		public function destroy():void
		{
		}
		
		private function handleAdded(event:Event):void
		{
			onAdded();
			
			removeEventListener( Event.ADDED_TO_STAGE, handleAdded );
			
			addEventListener( Event.REMOVED_FROM_STAGE, handleRemove );
			stage.addEventListener(FullScreenEvent.FULL_SCREEN, handleFullScreen);
			stage.addEventListener(Event.RESIZE, handleResize); 
		}
		
		private function handleResize(event:Event):void
		{
			onResize();
		}
		
		private function handleRemove(event:Event):void
		{
			removeEventListener( Event.REMOVED_FROM_STAGE, handleRemove );
			stage.removeEventListener(FullScreenEvent.FULL_SCREEN, handleFullScreen);
			stage.removeEventListener(Event.RESIZE, handleResize);
			onRemoved();
		}
		
		private function handleFullScreen(event:FullScreenEvent):void
		{
			isFullscreen = event.fullScreen;
			onResize();
		}		
		
		protected function onResize():void{}		
		protected function onRemoved():void{}		
		protected function onAdded():void{}

		public function get id():String
		{
			return _id;
		}

		public function set id(value:String):void
		{
			_id = value;
		}

	}
}