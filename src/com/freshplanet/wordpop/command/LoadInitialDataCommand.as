package com.freshplanet.wordpop.command
{
	import com.freshplanet.wordpop.api.ILoadDataService;
	import com.freshplanet.wordpop.model.ViewNames;
	import com.freshplanet.wordpop.model.WordPopModel;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class LoadInitialDataCommand extends Command
	{
		[Inject] public var loadDataService:ILoadDataService
		[Inject] public var model:WordPopModel;
		
		override public function execute():void
		{
			model.currentView = ViewNames.LOADING_VIEW;
			loadDataService.load();
		}
	}
}