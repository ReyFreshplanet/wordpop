package com.freshplanet.wordpop.events
{
	import flash.events.Event;
	
	public class WordPopEvent extends Event
	{
		private var _data:*;
		
		public static const INITIALIZE:String = "WordPopEvent.onInitBegin";
		public static const INITIALIZE_COMPLETE:String = "WordPopEvent.onInitComplete";
		public static const SHOW_SCREEN:String = "WordPopEvent.onShowSreenRequest";
		public static const ON_TICK:String = "WordPopEvent.onTick";
		public static const INITIAL_DATA_PARSE_COMPLETE:String = "WordPopEvent.onInitialDataParseComplete";
		public static const INITIAL_DATA_LOAD_FAIL:String = "WordPopEvent.onInitialDataLoadFail";
		
		public function WordPopEvent(type:String, data:*=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.data = data;
			super(type, bubbles, cancelable);
		}

		public function get data():*
		{
			return _data;
		}

		public function set data(value:*):void
		{
			_data = value;
		}
		
		override public function clone():Event
		{
			return new WordPopEvent(type, _data, bubbles, cancelable);
		}
	}
}