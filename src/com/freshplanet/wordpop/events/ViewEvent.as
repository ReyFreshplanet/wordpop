package com.freshplanet.wordpop.events
{
	import flash.events.Event;

	public class ViewEvent extends WordPopEvent
	{
		public static const PLAY_GAME_REQUEST:String = "ViewEvent.onPlayGameRequest";
		public static const BUILD_COMPLETE:String = "ViewEvent.onBuildComplete";
		
		public function ViewEvent(type:String, data:*=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, data, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ViewEvent(type, _data, bubbles, cancelable);
		}
	}
}