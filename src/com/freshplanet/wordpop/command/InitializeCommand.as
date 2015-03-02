package com.freshplanet.wordpop.command
{
	import com.freshplanet.wordpop.api.ILoadDataService;
	import com.freshplanet.wordpop.api.ITickerService;
	import com.freshplanet.wordpop.events.WordPopEvent;
	import com.freshplanet.wordpop.model.WordPopModel;
	
	import flash.events.IEventDispatcher;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class InitializeCommand extends Command
	{
		[Inject] public var dispatcher:IEventDispatcher;
		[Inject] public var ticker:ITickerService;
		[Inject] public var model:WordPopModel;
		[Inject] public var loadDataService:ILoadDataService;
		
		override public function execute():void
		{
			model.initialize();
			ticker.initialize();
			loadDataService.initialize(model.dataUrl);
			
			dispatcher.dispatchEvent(new WordPopEvent(WordPopEvent.INITIALIZE_COMPLETE));
		}
	}
}