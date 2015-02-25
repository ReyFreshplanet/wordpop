package com.freshplanet.wordpop.service
{
	import com.freshplanet.wordpop.core.BaseActor;
	import com.freshplanet.wordpop.events.WordPopEvent;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.freshplanet.wordpop.api.ITickerService;
	
	public class TickerService extends BaseActor implements ITickerService
	{
		private var timer:Timer;
		private var seconds:int;
		
		public function initialize():void
		{
			log(this, "initialized");
			
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTick);
			start();
		}
		
		public function start():void
		{
			timer.start();
		}
		
		public function stop():void
		{
			timer.stop();
		}
		
		protected function onTick(event:TimerEvent):void
		{
			seconds++;
			dispatch(new WordPopEvent(WordPopEvent.ON_TICK, seconds));
		}
	}
}