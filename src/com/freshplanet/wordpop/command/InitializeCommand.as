package com.freshplanet.wordpop.command
{
	import com.freshplanet.wordpop.api.ITickerService;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class InitializeCommand extends Command
	{
		[Inject] public var ticker:ITickerService;
		
		override public function execute():void
		{
			ticker.initialize();
		}
	}
}