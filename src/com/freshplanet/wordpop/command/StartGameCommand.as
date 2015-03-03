package com.freshplanet.wordpop.command
{
	import com.freshplanet.wordpop.api.IGameTimerService;
	import com.freshplanet.wordpop.model.ViewNames;
	import com.freshplanet.wordpop.model.WordPopModel;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class StartGameCommand extends Command
	{
		[Inject] public var model:WordPopModel;
		[Inject] public var timerService:IGameTimerService;
		
		override public function execute():void
		{
			timerService.start();
			model.currentView = ViewNames.HOME_VIEW;
		}
	}
}