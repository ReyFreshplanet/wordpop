package com.freshplanet.wordpop.service
{
	import com.freshplanet.wordpop.api.ITickerService;
	import com.freshplanet.wordpop.events.WordPopEvent;
	
	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class TickerService implements ITickerService
	{
		[Inject] public var dispatcher:IEventDispatcher;
		
		private var timer:Timer;
		private var seconds:int;
		
		public function initialize():void
		{
			log(this, "initialized");
			
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTick);
		}
		
		public function start():void
		{
			if(!timer.running)
				timer.start();
		}
		
		public function stop():void
		{
			if(timer.running)
				timer.stop();
		}
		
		protected function onTick(event:TimerEvent):void
		{
			seconds++;
			dispatcher.dispatchEvent(new WordPopEvent(WordPopEvent.ON_TICK, seconds));
		}
	}
}