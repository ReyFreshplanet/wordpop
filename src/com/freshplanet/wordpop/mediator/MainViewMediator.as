package com.freshplanet.wordpop.mediator
{
	import com.freshplanet.wordpop.api.IView;
	import com.freshplanet.wordpop.events.WordPopEvent;
	import com.freshplanet.wordpop.view.MainView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class MainViewMediator extends Mediator
	{
		[Inject] public var view:MainView;
		
		override public function initialize():void
		{
			addContextListener(WordPopEvent.SHOW_SCREEN, handleShowScreenRequest, WordPopEvent);
		}
		
		private function handleShowScreenRequest(event:WordPopEvent):void
		{
			view.showScreen(event.data.view as IView);
		}
	}
}