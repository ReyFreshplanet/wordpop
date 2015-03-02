package com.freshplanet.wordpop.command
{
	import com.freshplanet.wordpop.model.ViewNames;
	import com.freshplanet.wordpop.model.WordPopModel;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class StartGameCommand extends Command
	{
		[Inject] public var model:WordPopModel;
		
		override public function execute():void
		{
			model.currentView = ViewNames.HOME_VIEW;
		}
	}
}